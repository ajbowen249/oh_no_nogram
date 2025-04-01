g_puzzle_state = nil
C_CELL_SIZE = 5
C_BOARD_SIZE = C_CELL_SIZE * 15

C_PUZ_NULL = 0
C_PUZ_MARKED = 1
C_PUZ_CHIZ = 3

function init_puzzle(index)
  menuitem(1, 'exit', function() init_puzzle_grid() end)

  local puzzle = g_puzzles[index + 1]
  g_puzzle_state = {
    puzzle = puzzle,
    grid = {},
    row_runs = {},
    col_runs = {},
    x = 1,
    y = 1,
  }

  for i=1, #puzzle.image do
    local row = {}
    for j=1, #puzzle.image do
      add(row, C_PUZ_NULL)
    end

    add(g_puzzle_state.grid, row)
  end

  for row in all(puzzle.image) do
    local run_length = 0
    local row_runs = {}
    for col in all(row) do
      if col == 1 then
        run_length += 1
      else
        if run_length > 0 then
          add(row_runs, run_length)
          run_length = 0
        end
      end
    end

    if run_length > 0 or #row_runs == 0 then
      add(row_runs, run_length)
    end

    add(g_puzzle_state.row_runs, row_runs)
  end

  g_game_state = C_PUZZLE
end

function draw_puzzle()
  cls(13)
  local start_x = 128 - C_BOARD_SIZE - 2
  local start_y = 128 - C_BOARD_SIZE - 2
  local board_end_x = start_x + C_BOARD_SIZE
  local board_end_y = start_y + C_BOARD_SIZE

  rectfill(start_x, start_y, board_end_x, board_end_y, 15)
  rect(start_x, start_y, board_end_x, board_end_y, 4)

  for i, row in ipairs(g_puzzle_state.grid) do
    local y = start_y + ((i - 1) * C_CELL_SIZE)
    rect(start_x, y + C_CELL_SIZE, board_end_x, y + C_CELL_SIZE, 4)

    local row_runs = g_puzzle_state.row_runs[i]

    if i == g_puzzle_state.y then
      rectfill(2, y, start_x - 1, y + C_CELL_SIZE - 1, 12)
    end

    for ri=#row_runs, 1, -1 do
      local run_x = start_x - 5 - ((#row_runs - ri) * 5)
      local run_val = row_runs[ri]
      if run_val < 10 then
        print(run_val, run_x, y, i % 2 == 0 and 4 or 15)
      else
        if i % 2 != 0 then
          pal(4, 15)
        end
        spr(run_val - 4, run_x, y)
        pal()
      end
    end

    for j, cell in ipairs(row) do
      local x = start_x + ((j - 1) * C_CELL_SIZE)
      if i == 1 then
        rect(x + C_CELL_SIZE, start_y, x + C_CELL_SIZE, board_end_y, 4)
      end

      if cell == C_PUZ_MARKED then
        spr(4, x + 1, y + 1)
      elseif cell == C_PUZ_CHIZ then
        spr(5, x + 1, y + 1)
      end

      if i == g_puzzle_state.y and j == g_puzzle_state.x then
        spr(2, x, y)
      end
    end
  end
end

function update_puzzle()
  if btnp(0) and g_puzzle_state.x > 1 then
    g_puzzle_state.x -= 1
  elseif btnp(1) and g_puzzle_state.x < #g_puzzle_state.grid then
    g_puzzle_state.x += 1
  elseif btnp(2) and g_puzzle_state.y > 1 then
    g_puzzle_state.y -=1
  elseif btnp(3) and g_puzzle_state.y < #g_puzzle_state.grid then
    g_puzzle_state.y += 1
  end

  if btnp(4) then
    if g_puzzle_state.grid[g_puzzle_state.y][g_puzzle_state.x] != C_PUZ_MARKED then
      g_puzzle_state.grid[g_puzzle_state.y][g_puzzle_state.x] = C_PUZ_MARKED
    else
      g_puzzle_state.grid[g_puzzle_state.y][g_puzzle_state.x] = C_PUZ_NULL
    end
  elseif btnp(5) then
    g_puzzle_state.grid[g_puzzle_state.y][g_puzzle_state.x] = C_PUZ_CHIZ
  end
end
