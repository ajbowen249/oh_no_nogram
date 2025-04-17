g_puzzle_state = nil

function init_puzzle(index)
  g_puzzle_state = create_puzzle_state(g_puzzles[index + 1])

  g_game_state = C_PUZZLE
  transition_in(function() end)
end

function draw_puzzle()
  draw_puzzle_common(g_puzzle_state)
end

function update_puzzle()
  if g_puzzle_state.state == C_PUZZLE_STATE_GAME_OVER or g_puzzle_state.state == C_PUZZLE_STATE_WIN then
    if btnp(4) or btnp(5) then
      to_puzzle_grid_from_anywhere()
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
    mark_puzzle_space(g_puzzle_state)
  elseif btnp(5) then
    try_punch_puzzle_space(g_puzzle_state)
  end

  if is_game_won(g_puzzle_state) then
    g_puzzle_state.is_win = true
    g_puzzle_state.state = C_PUZZLE_STATE_WIN
  end
end
