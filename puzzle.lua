g_puzzle_state = nil
C_STARTING_GAFFES = 10
C_CELL_SIZE = 6
C_BOARD_SIZE = C_CELL_SIZE * 15

C_PUZZLE_STATE_PLAYING = 0
C_PUZZLE_STATE_GAME_OVER = 1
C_PUZZLE_STATE_WIN = 2
C_PUZZLE_TRANSITION_OUT = 3

C_PUZ_NULL = 0
C_PUZ_MARKED = 1
C_PUZ_CHIZ = 3

g_active_pencil_spr = 2
g_pencil_x_offset = 0
g_pencil_y_offset = 0

function init_puzzle(index)
  menuitem(1, 'exit', function() exit_puzzle() end)
  g_active_pencil_spr = 2
  g_pencil_x_offset = 0
  g_pencil_y_offset = 0

  local puzzle = parse_puzzle(g_puzzles[index + 1])
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
  transition_in(function() end)
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
  local is_win = g_puzzle_state.state == C_PUZZLE_STATE_WIN
  local redraw_board = true

  if redraw_board then
    rectfill(0, 0, 127, 127, 13)

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

      if not is_win then
        horizontal_dotted_line(y + C_CELL_SIZE, start_x, board_end_x, 4, 15)
        if i % 5 == 0 then
          rect(start_x, y + C_CELL_SIZE, board_end_x, y + C_CELL_SIZE, 4)
        end
      end

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
          if not is_win then
            vertical_dotted_line(x + C_CELL_SIZE, start_y, board_end_y, 4, 15)
            if j % 5 == 0
            then
              rect(x + C_CELL_SIZE, start_y, x + C_CELL_SIZE, board_end_y, 4)
            end
          end

          if j == g_puzzle_state.x then
            rectfill(x, 2, x + C_CELL_SIZE - 1, start_y - 1, 12)
          end

          local col_runs = g_puzzle_state.col_runs[j]
          for ci=#col_runs, 1, -1 do
            local run_y = start_y - 5 - ((#col_runs - ci) * 5)
            print_run_number(col_runs[ci], x + i, run_y, ci)
          end
        end

        if cell == C_PUZ_MARKED and not is_win then
          spr(4, x + 1, y + 1)
        elseif cell == C_PUZ_CHIZ then
          spr(is_win and 21 or 5, x + 1, y + 1)
        end

        if i == g_puzzle_state.y and j == g_puzzle_state.x then
          cursor_loc = { x = x, y = y }
        end
      end

      if cursor_loc != nil and not is_win then
        spr(g_active_pencil_spr, cursor_loc.x + g_pencil_x_offset, cursor_loc.y + g_pencil_y_offset)
      end
    end

    if g_puzzle_state.state == C_PUZZLE_STATE_WIN then
      rectfill(10, 10, 118, 32, 3)
      rect(10, 10, 118, 32, 11)
      local name_len = get_string_pixel_width(g_puzzle_state.puzzle.name)
      local name_x = (128 - name_len) / 2
      print("solved!", 50, 12, 11)
      print(g_puzzle_state.puzzle.name, name_x, 19, 11)
      print("press 🅾️ or ❎", 36, 25, 11)
    elseif g_puzzle_state.state == C_PUZZLE_STATE_GAME_OVER then
      rectfill(10, 10, 118, 26, 2)
      rect(10, 10, 118, 26, 8)
      print("game over 😐", 40, 12, 8)
      print("press 🅾️ or ❎", 36, 19, 8)
    end
  end
end

function is_game_won()
  for i=1, #g_puzzle_state.grid do
    for j=1, #g_puzzle_state.grid do
      if g_puzzle_state.puzzle.image[i][j] and g_puzzle_state.grid[i][j] != C_PUZ_CHIZ then
        return false
      end
    end
  end

  return true
end

function update_puzzle()
  if g_puzzle_state.state == C_PUZZLE_STATE_GAME_OVER or g_puzzle_state.state == C_PUZZLE_STATE_WIN then
    if btnp(4) or btnp(5) then
      exit_puzzle()
    end

    return
  end

  if g_puzzle_state.state == C_PUZZLE_TRANSITION_OUT then
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
      animate_pencil_mark()
      sfx(3)
    else
      animate_pencil_erase()
      g_puzzle_state.grid[g_puzzle_state.y][g_puzzle_state.x] = C_PUZ_NULL
    end
  elseif btnp(5) then
    if not g_puzzle_state.puzzle.image[g_puzzle_state.y][g_puzzle_state.x] then
      g_puzzle_state.gaffes -= 1

      if g_puzzle_state.gaffes >= 1 then
        sfx(0)
      elseif g_puzzle_state.gaffes == 0 then
        sfx(1)
      end

      if g_puzzle_state.gaffes <= 0 then
        g_puzzle_state.state = C_PUZZLE_STATE_GAME_OVER
      end
    else
      if g_puzzle_state.grid[g_puzzle_state.y][g_puzzle_state.x] != C_PUZ_CHIZ then
        g_puzzle_state.grid[g_puzzle_state.y][g_puzzle_state.x] = C_PUZ_CHIZ
        animate_pencil_punch()
        sfx(2)
      end
    end
  end

  if is_game_won() then
    g_puzzle_state.state = C_PUZZLE_STATE_WIN
  end
end

function animate_pencil_punch()
  dispatch_draw_coroutine(co_animate({ 18, 34, 18, 2 }, 0, function(sprite) g_active_pencil_spr = sprite end))
end

function animate_pencil_mark()
  dispatch_draw_coroutine(co_animate({
    { -2, 2 },
    { -1, 1 },
    {  -1, 1 },
    { 2, -2 },
    { 0, 0 },
  }, 0, function(offset)
      g_pencil_x_offset = offset[1]
      g_pencil_y_offset = offset[2]
    end)
  )
end

function animate_pencil_erase()
  dispatch_draw_coroutine(co_animate({ 19, 35, 51, 35, 2 }, 0, function(sprite) g_active_pencil_spr = sprite end))
end

function exit_puzzle()
  g_puzzle_state.state = C_PUZZLE_TRANSITION_OUT

  transition_out(function()
    init_puzzle_grid()
  end)
end
