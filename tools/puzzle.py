import os
import sys

from typing import List

from PIL import Image

sys.path.append(os.path.join(os.path.dirname(__file__), '..'))

from tools.os_util import *

def get_list_runs(list):
    run_length = 0
    runs = []
    for cell in list:
        if cell:
            run_length += 1
        else:
            if run_length > 0:
                runs.append(run_length)
                run_length = 0

    if run_length > 0 or len(runs) == 0:
        runs.append(run_length)

    return runs

class Puzzle:
    def __init__(self, name: str, size: int, grid: List[bool]):
        self.name = name
        self.size = size
        self.grid = grid
        self.difficulty = self.get_difficulty()

    def get_string(self) -> str:
        escaped_name = self.name.replace("'", "\\'")
        puzzle_string = f'{escaped_name}|{self.size}|'
        for row in self.grid:
            for pixel in row:
                puzzle_string += '1' if pixel else '0'

        return puzzle_string

    @property
    def is_tutorial(self) -> bool:
        return self.name == 'tutorial'

    def get_difficulty(self) -> int:
        row_runs = []
        for row in self.grid:
            row_runs.append(get_list_runs(row))

        col_runs = []
        for col_index in range(0, self.size):
            column = []
            for row_index in range(0, self.size):
                column.append(self.grid[row_index][col_index])

            col_runs.append(get_list_runs(column))

        def get_run_totals(runs) -> int:
            total = 0
            for run in runs:
                if len(run) == 1:
                    if run[0] != 0 and run[0] != 15:
                        total += 1
                else:
                    total += len(run)

            return total

        return get_run_totals(row_runs) + get_run_totals(col_runs)

def iterate_puzzle_folder(puzzles_path: path, puzzle_info: List[Puzzle], include_tests: bool):
    for puzzle in os.listdir(puzzles_path):
        name = puzzle.split(".")[0]
        if name.startswith('test ') and not include_tests:
            continue

        with Image.open(path.join(puzzles_path, puzzle)) as imFile:
            size = imFile.size[0]
            if size != imFile.size[1]:
                raise Exception(f'{puzzle} is not square! {imFile.size}')
            elif size != 5 and size != 10 and size != 15:
                raise Exception(f'{puzzle} is not unsupported size! {imFile.size}')

            pixels = imFile.load()
            grid = []
            for row in range(0, size):
                grid_row = []
                for col in range(0, size):
                    grid_row.append(pixels[col, row] == (0, 0, 0) or pixels[col, row] == (0, 0, 0, 255))
                grid.append(grid_row)

            puzzle_info.append(Puzzle(name, size, grid))

def create_puzzle_file(is_premium: bool, include_tests: bool):
    puzzles_path = path.join(CWD, 'puzzles')
    puzzle_info: List[Puzzle] = []
    iterate_puzzle_folder(puzzles_path, puzzle_info, include_tests)

    if is_premium:
        premium_puzzles_path = path.join(CWD, 'oh_no_nogram_premium_puzzles', 'puzzles')
        if not path.exists(premium_puzzles_path):
            print('Premium puzzles not found.')
            exit(-1)
        else:
            iterate_puzzle_folder(premium_puzzles_path, puzzle_info, include_tests)

    tutorial_puzzle = [x for x in puzzle_info if x.is_tutorial][0]
    game_puzzles = [x for x in puzzle_info if not x.is_tutorial]

    sorted_info = sorted(game_puzzles, key=lambda p: p.difficulty)

    puzzles_file_text = f'''
        g_all_puzzles_str = '{','.join(map(lambda p: p.get_string(), sorted_info))}'

        g_puzzles = split(g_all_puzzles_str, ',', false)
        g_tutorial_puzzle = '{tutorial_puzzle.get_string()}'

        '''

    overwrite_whole_file(path.join(OUT_DIR, 'puzzles.lua'), puzzles_file_text)

    # Leave a guide so the dev knows where they all ended up
    puzzle_guide_string = ''
    for i in range(0, len(sorted_info)):
        puzzle = sorted_info[i]
        puzzle_guide_string += f'{i + 1}: {puzzle.name} ({puzzle.difficulty})\n'

    overwrite_whole_file(path.join(OUT_DIR, 'puzzle_guide.txt'), puzzle_guide_string)
