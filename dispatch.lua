pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

g_managed_coroutines = {}
g_managed_draw_coroutines = {}
g_managed_predraw_coroutines = {}

-- note: only works when called within a coroutine!
function delay(dt)
  local start = time()
    while time() - start <= dt do
      yield()
    end
end

-- note: only works when called within a coroutine!
function iter_delay(frames, dt, callback)
  for i=1,#frames do
    delay(dt)
    callback(frames[i], i, i == #frames)
  end
end

function co_delay(dt, callback)
  return cocreate(function()
    local start = time()
    delay(dt)

    callback()
  end)
end

function co_animate(frames, dt, callback)
  return cocreate(function()
    iter_delay(frames, dt, callback)
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

function process_dispatch_queue(g_managed_coroutines)
  local running_routines = {}
  for coroutine in all(g_managed_coroutines) do
    if coroutine and costatus(coroutine) != 'dead' then
      local status, message = coresume(coroutine)
      if message then
        cls()
        printh(trace(coroutine, message))
        stop(trace(coroutine, message))
      end
      add(running_routines, coroutine)
    end
  end

  return running_routines
end

function predraw_dispatch()
  g_managed_predraw_coroutines = process_dispatch_queue(g_managed_predraw_coroutines)
end

function draw_dispatch()
  g_managed_draw_coroutines = process_dispatch_queue(g_managed_draw_coroutines)
end

function update_dispatch()
  g_managed_coroutines = process_dispatch_queue(g_managed_coroutines)
end
