g_tutorial_state = nil

function init_tutorial()
  g_tutorial_state = create_puzzle_state(g_tutorial_puzzle)

  g_game_state = C_TUTORIAL
  transition_in(function() end)
end

function draw_tutorial()
  draw_puzzle_common(g_tutorial_state)
end

function update_tutorial()
  if btnp(4) then
    init_main_menu()
  end
end
