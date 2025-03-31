function init_tutorial()
  g_game_state = C_TUTORIAL
end

function draw_tutorial()
  cls()
  print("cOMING SOON. pRESS 🅾️ TO RETURN.")
end

function update_tutorial()
  if btnp(4) then
    init_main_menu()
  end
end
