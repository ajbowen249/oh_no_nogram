C_STARTING_GAFFES = 10
C_CELL_SIZE = 6

C_PUZZLE_STATE_PLAYING = 0
C_PUZZLE_STATE_GAME_OVER = 1
C_PUZZLE_STATE_WIN = 2
C_PUZZLE_TRANSITION_OUT = 3

C_PUZ_NULL = 0
C_PUZ_MARKED = 1
C_PUZ_CHIZ = 3

g_active_pencil_spr = 16
g_pencil_x_offset = 0
g_pencil_y_offset = 0
g_gaff_color = 4

function create_puzzle_state(raw_puzzle)
  g_active_pencil_spr = 16
  g_pencil_x_offset = 0
  g_pencil_y_offset = 0

  local puzzle = parse_puzzle(raw_puzzle)
  local state = {
    puzzle = puzzle,
    grid = {},
    row_runs = {},
    col_runs = {},
    x = 1,
    y = 1,
    gaffes = C_STARTING_GAFFES,
    state = C_PUZZLE_STATE_PLAYING,
    board_size = C_CELL_SIZE * puzzle.size,
    is_win = false,
  }

  for i=1, #puzzle.image do
    local row = {}
    for j=1, #puzzle.image do
      add(row, C_PUZ_NULL)
    end

    add(state.grid, row)
  end

  for row in all(puzzle.image) do
    add(state.row_runs, get_list_runs(row))
  end

  for coli=1, #puzzle.image do
    local col = {}
    for rowi=1, #puzzle.image do
      add(col, puzzle.image[rowi][coli])
    end

    add(state.col_runs, get_list_runs(col))
  end

  return state
end

g_number_sprites = {
  [10] = 18,
  [11] = 34,
  [12] = 50,
  [13] = 3,
  [14] = 19,
  [15] = 35,
}

function print_run_number(run_val, run_x, y, i)
  if run_val < 10 then
    print(run_val, run_x, y, i % 2 == 0 and 4 or 15)
  else
    if i % 2 != 0 then
      pal(4, 15)
    end
    spr(g_number_sprites[run_val], run_x, y)
    pal()
  end
end

function draw_puzzle_common(state)
  local redraw_board = true

  if redraw_board then
    rectfill(0, 0, 127, 127, 13)

    print("gaffes:", 1, 1, state.gaffes > 3 and g_gaff_color or 8)
    print(state.gaffes, 1, 8, state.gaffes > 3 and g_gaff_color or 8)

    local start_x = 36
    local start_y = 36
    local board_end_x = start_x + state.board_size
    local board_end_y = start_y + state.board_size

    rectfill(start_x, start_y, board_end_x, board_end_y, 15)
    rect(start_x, start_y, board_end_x, board_end_y, 4)
    local cursor_loc = nil

    for i, row in ipairs(state.grid) do
      local y = start_y + ((i - 1) * C_CELL_SIZE)

      if not state.is_win then
        horizontal_dotted_line(y + C_CELL_SIZE, start_x, board_end_x, 4, 15)
        if i % 5 == 0 then
          rect(start_x, y + C_CELL_SIZE, board_end_x, y + C_CELL_SIZE, 4)
        end
      end

      if i == state.y then
        rectfill(2, y, start_x - 1, y + C_CELL_SIZE - 1, 12)
      end

      local row_runs = state.row_runs[i]
      for ri=#row_runs, 1, -1 do
        local run_x = start_x - 5 - ((#row_runs - ri) * 5)
        print_run_number(row_runs[ri], run_x, y, i)
      end

      for j, cell in ipairs(row) do
        local x = start_x + ((j - 1) * C_CELL_SIZE)
        if i == 1 then
          if not state.is_win then
            vertical_dotted_line(x + C_CELL_SIZE, start_y, board_end_y, 4, 15)
            if j % 5 == 0
            then
              rect(x + C_CELL_SIZE, start_y, x + C_CELL_SIZE, board_end_y, 4)
            end
          end

          if j == state.x then
            rectfill(x, 2, x + C_CELL_SIZE - 1, start_y - 1, 12)
          end

          local col_runs = state.col_runs[j]
          for ci=#col_runs, 1, -1 do
            local run_y = start_y - 5 - ((#col_runs - ci) * 5)
            print_run_number(col_runs[ci], x + i, run_y, ci)
          end
        end

        if cell == C_PUZ_MARKED and not state.is_win then
          spr(2, x + 1, y + 1)
        elseif cell == C_PUZ_CHIZ then
          local offset = state.is_win and 6 or 5
          rectfill(x + 1, y + 1, x + offset, y + offset, 1)
        end

        if i == state.y and j == state.x then
          cursor_loc = { x = x, y = y }
        end
      end

      if cursor_loc != nil and not state.is_win then
        spr(g_active_pencil_spr, cursor_loc.x + g_pencil_x_offset, cursor_loc.y + g_pencil_y_offset)
      end
    end

    if state.state == C_PUZZLE_STATE_WIN then
      rectfill(10, 10, 118, 32, 3)
      rect(10, 10, 118, 32, 11)
      local name_len = get_string_pixel_width(state.puzzle.name)
      local name_x = (128 - name_len) / 2
      print("solved!", 50, 12, 11)
      print(state.puzzle.name, name_x, 19, 11)
      print("press 🅾️ or ❎", 36, 25, 11)
    elseif state.state == C_PUZZLE_STATE_GAME_OVER then
      rectfill(10, 10, 118, 26, 2)
      rect(10, 10, 118, 26, 8)
      print("game over 😐", 40, 12, 8)
      print("press 🅾️ or ❎", 36, 19, 8)
    end
  end
end

function mark_puzzle_space(state)
  if state.grid[state.y][state.x] == C_PUZ_CHIZ then
    return
  end

  if state.grid[state.y][state.x] != C_PUZ_MARKED then
    state.grid[state.y][state.x] = C_PUZ_MARKED
    animate_pencil_mark()
    sfx(3)
  else
    animate_pencil_erase()
    state.grid[state.y][state.x] = C_PUZ_NULL
  end
end

function try_punch_puzzle_space(state)
  if not state.puzzle.image[state.y][state.x] then
    state.gaffes -= 1

    if state.gaffes >= 1 then
      sfx(0)
      animate_gaff_blink()
    elseif state.gaffes == 0 then
      sfx(1)
    end

    if state.gaffes <= 0 then
      state.state = C_PUZZLE_STATE_GAME_OVER
    end
  else
    if state.grid[state.y][state.x] != C_PUZ_CHIZ then
      state.grid[state.y][state.x] = C_PUZ_CHIZ
      animate_pencil_punch()
      sfx(2)
    end
  end
end

function is_game_won(state)
  for i=1, #state.grid do
    for j=1, #state.grid do
      if state.puzzle.image[i][j] and state.grid[i][j] != C_PUZ_CHIZ then
        return false
      end
    end
  end

  return true
end

function animate_pencil_punch()
  dispatch_draw_coroutine(co_animate({ 32, 48, 32, 16 }, 0, function(sprite) g_active_pencil_spr = sprite end))
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
  dispatch_draw_coroutine(co_animate({ 17, 33, 49, 33, 16 }, 0, function(sprite) g_active_pencil_spr = sprite end))
end

function animate_gaff_blink()
  dispatch_draw_coroutine(co_animate({ 9, 4, 9, 4 }, .1, function(color) g_gaff_color = color end))
end
