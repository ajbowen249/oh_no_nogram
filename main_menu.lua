g_main_menu_state = nil

function init_main_menu()
  g_main_menu_state = {
    index = 1,
  }

  g_game_state = C_MAIN_MENU

  transition_in(function() end)
end

g_main_menu_options = {
  {
    text = 'select puzzle',
    func = function()
      init_puzzle_grid()
    end,
    y = 49,
  },
  {
    text = 'tutorial',
    func = function()
      init_tutorial()
    end,
    y = 69,
  }
}

function draw_main_menu()
  rectfill(0, 0, 127, 127, 2)

  map(0, 0, 40, 10, 6, 3)

  for i,option in ipairs(g_main_menu_options) do
    local fill_color = i == g_main_menu_state.index and 10 or 2
    local width = get_string_pixel_width(option.text) + 4
    local box_x = (128 - width) / 2
    rectfill(box_x, option.y, 128 - box_x, option.y + 10, fill_color)
    rect(box_x, option.y, 128 - box_x, option.y + 10, 5)
    print(option.text, box_x + 2, option.y + 3, 5)
  end
end

function update_main_menu()
  if btnp(2) and g_main_menu_state.index > 1 then
    g_main_menu_state.index -= 1
  elseif btnp(3) and g_main_menu_state.index < 2 then
    g_main_menu_state.index += 1
  end

  if btnp(5) then
    transition_out(function()
      g_main_menu_options[g_main_menu_state.index].func()
    end)
  end
end
