function init_tutorial()
  g_game_state = C_TUTORIAL
  transition_in(function() end)
end

function draw_tutorial()
  rectfill(0, 0, 127, 127, 0)
  print("cOMING SOON. pRESS 🅾️ TO RETURN.", 0, 64, 7)
end

function update_tutorial()
  if btnp(4) then
    init_main_menu()
  end
end
