function init_cart_menu()
  menuitem(1, 'to puzzle selection', function() to_puzzle_grid_from_anywhere() end)
  menuitem(2, 'show intro', function() init_intro() end)
end
