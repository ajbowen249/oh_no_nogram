g_prof_is_talking = false

function draw_professor(x, y, p)
  pal()
  pal(11, g_prof_is_talking and 1 or 15)
  spr(4, x, y, 4, 4)
  pal()

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
