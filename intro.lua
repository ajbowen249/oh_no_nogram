g_intro_state = nil

function init_intro()
  g_intro_state = {
    drawfunc = nil,
    stars = {},
  }

  for i = 1, 40 do
    add(g_intro_state.stars, { rnd(127), rnd(64) })
  end

  g_game_state = C_INTRO

  transition_in(function()
    intro_exterior()
  end)
end

function draw_intro()
  if g_intro_state.drawfunc != nil then
    g_intro_state.drawfunc()
  end
end

function update_intro()
  if btnp(5) then
    transition_out(function()
      init_main_menu()
    end)
  end
end

function draw_museum_exterior(x, y)
  circfill(x - 7, y + 24, 7, 6)
  circ(x - 7, y + 24, 7, 5)

  circfill(x + 56, y + 24, 7, 6)
  circ(x + 56, y + 24, 7, 5)

  rectfill(x - 15, y + 24, x + 64, y + 55, 6)
  rect(x - 15, y + 24, x + 64, y + 55, 5)
  rectfill(x, y + 24, x + 49, y + 55, 1)
  rect(x, y + 24, x + 49, y + 55, 5)
  rectfill(x, y + 24, x + 49, y + 55, 1)

  rectfill(x - 12, y + 30, x - 3, y + 46, 10)
  rect(x - 12, y + 30, x - 3, y + 46, 5)
  rect(x - 12, y + 38, x - 3, y + 39, 5)
  rect(x - 8, y + 30, x - 7, y + 46, 5)

  rectfill(x + 52, y + 30, x + 61, y + 46, 10)
  rect(x + 52, y + 30, x + 61, y + 46, 5)
  rect(x + 52, y + 38, x + 61, y + 39, 5)
  rect(x + 56, y + 30, x + 57, y + 46, 5)

  spr(128, x, y, 7, 3)
  spr(46, x, y + 24, 2, 2)
  spr(46, x, y + 40, 2, 2, false, true)

  spr(46, x + 17, y + 24, 2, 2)
  spr(46, x + 17, y + 40, 2, 2, false, true)

  spr(46, x + 34, y + 24, 2, 2)
  spr(46, x + 34, y + 40, 2, 2, false, true)

  rectfill(x - 15, y + 55, x + 64, y + 67, 6)
  rect(x - 15, y + 55, x + 64, y + 67, 5)

  rect(x + 8, y + 64, x + 41, y + 64, 5)
  rect(x + 6, y + 61, x + 43, y + 61, 5)
  rect(x + 3, y + 58, x + 46, y + 58, 5)

  line(x, y + 55, x + 10, y + 67, 5)
  line(x + 49, y + 55, x + 39, y + 67, 5)
end

function intro_exterior()
  g_intro_state.drawfunc = function()
    cls(1)

    for star in all(g_intro_state.stars) do
      pset(star[1], star[2], 7)
    end

    rectfill(0, 64, 127, 127, 3)

    rectfill(0, 109, 127, 127, 0)

    rectfill(0, 100, 127, 110, 6)
    rect(0, 100, 127, 110, 5)

    spr(76, 20, 10, 2, 2)

    draw_museum_exterior(38, 35)
  end
end
