function init_puzzle(index)
  g_game_state = C_PUZZLE
end

function draw_puzzle()
  cls(13)
end

function update_puzzle()
  if btnp(4) then
    init_puzzle_grid()
  end
end
