g_puzzle_state = nil
C_STARTING_GAFFES = 10
C_CELL_SIZE = 6
C_BOARD_SIZE = C_CELL_SIZE * 15

C_PUZZLE_STATE_PLAYING = 0
C_PUZZLE_STATE_GAME_OVER = 1

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
    gaffes = C_STARTING_GAFFES,
    state = C_PUZZLE_STATE_PLAYING,
  }

  for i=1, #puzzle.image do
    local row = {}
    for j=1, #puzzle.image do
      add(row, C_PUZ_NULL)
    end

    add(g_puzzle_state.grid, row)
  end

  for row in all(puzzle.image) do
    add(g_puzzle_state.row_runs, get_list_runs(row))
  end

  for coli=1, #puzzle.image do
    local col = {}
    for rowi=1, #puzzle.image do
      add(col, puzzle.image[rowi][coli])
    end

    add(g_puzzle_state.col_runs, get_list_runs(col))
  end

  g_game_state = C_PUZZLE
end

function print_run_number(run_val, run_x, y, i)
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

function draw_puzzle()
  if g_puzzle_state.state == C_PUZZLE_STATE_PLAYING then
    cls(13)

    print("gaffes:", 1, 1, g_puzzle_state.gaffes > 3 and 4 or 8)
    print(g_puzzle_state.gaffes, 1, 8, g_puzzle_state.gaffes > 3 and 4 or 8)

    local start_x = 128 - C_BOARD_SIZE - 2
    local start_y = 128 - C_BOARD_SIZE - 2
    local board_end_x = start_x + C_BOARD_SIZE
    local board_end_y = start_y + C_BOARD_SIZE

    rectfill(start_x, start_y, board_end_x, board_end_y, 15)
    rect(start_x, start_y, board_end_x, board_end_y, 4)
    local cursor_loc = nil

    for i, row in ipairs(g_puzzle_state.grid) do
      local y = start_y + ((i - 1) * C_CELL_SIZE)
      rect(start_x, y + C_CELL_SIZE, board_end_x, y + C_CELL_SIZE, 4)

      if i == g_puzzle_state.y then
        rectfill(2, y, start_x - 1, y + C_CELL_SIZE - 1, 12)
      end

      local row_runs = g_puzzle_state.row_runs[i]
      for ri=#row_runs, 1, -1 do
        local run_x = start_x - 5 - ((#row_runs - ri) * 5)
        print_run_number(row_runs[ri], run_x, y, i)
      end

      for j, cell in ipairs(row) do
        local x = start_x + ((j - 1) * C_CELL_SIZE)
        if i == 1 then
          rect(x + C_CELL_SIZE, start_y, x + C_CELL_SIZE, board_end_y, 4)

          if j == g_puzzle_state.x then
            rectfill(x, 2, x + C_CELL_SIZE - 1, start_y - 1, 12)
          end

          local col_runs = g_puzzle_state.col_runs[j]
          for ci=#col_runs, 1, -1 do
            local run_y = start_y - 5 - ((#col_runs - ci) * 5)
            print_run_number(col_runs[ci], x + i, run_y, ci)
          end
        end

        if cell == C_PUZ_MARKED then
          spr(4, x + 1, y + 1)
        elseif cell == C_PUZ_CHIZ then
          spr(5, x + 1, y + 1)
        end

        if i == g_puzzle_state.y and j == g_puzzle_state.x then
          cursor_loc = { x = x, y = y }
        end
      end

      if cursor_loc != nil then
        spr(2, cursor_loc.x, cursor_loc.y)
      end
    end
  elseif g_puzzle_state.state == C_PUZZLE_STATE_GAME_OVER then
    rectfill(10, 10, 118, 26, 2)
    rect(10, 10, 118, 26, 8)
    print("game over 😐", 40, 12)
    print("press 🅾️ or ❎", 36, 19)
  end
end

function update_puzzle()
  if g_puzzle_state.state == C_PUZZLE_STATE_GAME_OVER then
    if btnp(4) or btnp(5) then
      init_puzzle_grid()
    end

    return
  end

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
    if g_puzzle_state.puzzle.image[g_puzzle_state.y][g_puzzle_state.x] == 0 then
      g_puzzle_state.gaffes -= 1

      if g_puzzle_state.gaffes <= 0 then
        g_puzzle_state.state = C_PUZZLE_STATE_GAME_OVER
      end
    else
      g_puzzle_state.grid[g_puzzle_state.y][g_puzzle_state.x] = C_PUZ_CHIZ
    end
  end
end
