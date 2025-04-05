g_puzzle_grid_state = nil

C_PUZZLES_PER_ROW = 8
C_PUZZLE_BOX_SIZE = 5
C_PUZZLE_TOTAL_SIZE = C_PUZZLE_BOX_SIZE + 3

g_puzzle_rows = ceil(#g_puzzles / C_PUZZLES_PER_ROW)

function init_puzzle_grid()
  g_puzzle_grid_state = {
    x = 0,
    y = 0,
  }

  g_game_state = C_PUZZLE_GRID
  transition_in(function() end)
end

function get_puzzle_index()
  return g_puzzle_grid_state.y * C_PUZZLES_PER_ROW + g_puzzle_grid_state.x
end

function draw_puzzle_grid()
  rectfill(0, 0, 127, 127, 12)
  local start_x = 32
  local start_y = 16

  for i=0,#g_puzzles-1 do
    local row = flr(i / C_PUZZLES_PER_ROW)
    local col = i % C_PUZZLES_PER_ROW

    local box_x = start_x + (col * C_PUZZLE_TOTAL_SIZE)
    local box_y = start_y + (row * C_PUZZLE_TOTAL_SIZE)
    rect(box_x, box_y, box_x + C_PUZZLE_BOX_SIZE, box_y + C_PUZZLE_BOX_SIZE, 7)
  end

  local cursor_x = start_x + (g_puzzle_grid_state.x * C_PUZZLE_TOTAL_SIZE) + 1
  local cursor_y = start_y + (g_puzzle_grid_state.y * C_PUZZLE_TOTAL_SIZE) + 3

  spr(1, cursor_x, cursor_y)

  local puzzle_index = get_puzzle_index()
  print('puzzle '.. puzzle_index + 1, 1, 1, 5)
end

function update_puzzle_grid()
  if btnp(4) then
    transition_out(function()
      init_main_menu()
    end)
  end

  if btnp(0) and g_puzzle_grid_state.x > 0 then
    g_puzzle_grid_state.x -= 1
  elseif btnp(1) and g_puzzle_grid_state.x < C_PUZZLES_PER_ROW - 1 then
    g_puzzle_grid_state.x += 1
    local puzzle_index = get_puzzle_index()
    if puzzle_index > #g_puzzles - 1 then
      g_puzzle_grid_state.x -= 1
    end
  elseif btnp(2) and g_puzzle_grid_state.y > 0 then
    g_puzzle_grid_state.y -= 1
  elseif btnp(3) and g_puzzle_grid_state.y < g_puzzle_rows - 1 then
    g_puzzle_grid_state.y += 1
    local puzzle_index = get_puzzle_index()
    if puzzle_index > #g_puzzles - 1 then
      g_puzzle_grid_state.y -= 1
    end
  end

  if btnp(5) then
    local puzzle_index = get_puzzle_index()
    transition_out(function()
      init_puzzle(puzzle_index)
    end)
  end
end
