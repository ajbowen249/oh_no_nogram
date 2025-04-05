pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

g_managed_coroutines = {}
g_managed_draw_coroutines = {}
g_managed_predraw_coroutines = {}

function co_delay(dt, callback)
  return cocreate(function()
    local start = time()
    while time() - start <= dt do
      yield()
    end

    callback()
  end)
end

function co_animate(frames, dt, callback)
  return cocreate(function()
    for frame in all(frames) do
      local start = time()
      while time() - start <= dt do
        yield()
      end

      callback(frame)
    end
  end)
end

function dispatch_coroutine(coroutine)
  add(g_managed_coroutines, coroutine)
end

function dispatch_draw_coroutine(coroutine)
  add(g_managed_draw_coroutines, coroutine)
end


function dispatch_predraw_coroutine(coroutine)
  add(g_managed_predraw_coroutines, coroutine)
end

function predraw_dispatch()
  local running_routines = {}
  for coroutine in all(g_managed_predraw_coroutines) do
    if coroutine and costatus(coroutine) != 'dead' then
      coresume(coroutine)
      add(running_routines, coroutine)
    end
  end

  g_managed_predraw_coroutines = running_routines
end

function draw_dispatch()
  local running_routines = {}
  for coroutine in all(g_managed_draw_coroutines) do
    if coroutine and costatus(coroutine) != 'dead' then
      coresume(coroutine)
      add(running_routines, coroutine)
    end
  end

  g_managed_draw_coroutines = running_routines
end


function update_dispatch()
  local running_routines = {}
  for coroutine in all(g_managed_coroutines) do
    if coroutine and costatus(coroutine) != 'dead' then
      coresume(coroutine)
      add(running_routines, coroutine)
    end
  end

  g_managed_coroutines = running_routines
end
