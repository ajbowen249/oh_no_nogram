g_prof_is_talking = false
g_prof_blink_level = 0
g_prof_blink_is_blinking = false
g_prof_larm = 6
g_prof_rarm = 6

function draw_professor(x, y, p)
  pal()
  pal(11, g_prof_is_talking and 1 or 15)
  spr(4, x + 10, y, 2, 4)
  spr(g_prof_larm, x - 6, y + 11, 2, 2)
  spr(g_prof_rarm, x + 20, y + 11, 2, 2, true)
  pal()

  if g_prof_blink_level > 0 then
    rect(x + 12, y + 4, x + 13, y + 4 + g_prof_blink_level - 1, 15)
    rect(x + 16, y + 4, x + 17, y + 4 + g_prof_blink_level - 1, 15)
  end

  if p != nil then
    pal(p)
  end
end

function animate_prof_talk(frames)
  local fvals = {}
  for i=1,frames do
    add(fvals, i % 2 == 0)
  end

  add(fvals, false)

  dispatch_draw_coroutine(co_animate(fvals, .075, function(f) g_prof_is_talking = f end))
end

function animate_prof_blink()
  g_prof_blink_is_blinking = true
  dispatch_draw_coroutine(co_animate({0, 1, 2, 1, 0}, 0.05, function(level, i, is_end)
    g_prof_blink_level = level

    if is_end and g_prof_blink_is_blinking then
      dispatch_coroutine(co_delay(rnd(5), function()
        if g_prof_blink_is_blinking then
          animate_prof_blink()
        end
      end))
    end
  end))
end

function stop_prof_blink()
  g_prof_blink_is_blinking = false
end

function animate_prof_point_left()
  g_prof_blink_is_blinking = true
  dispatch_draw_coroutine(co_animate({6, 38, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 38, 6}, 0.1, function(arm)
    g_prof_larm = arm
  end))
end
