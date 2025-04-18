g_tutorial_state = nil

function init_tutorial()
  g_tutorial_state = create_puzzle_state(g_tutorial_puzzle)
  g_tutorial_state.message = ''
  g_tutorial_state.row_runs_border = false
  g_tutorial_state.col_runs_border = false

  g_game_state = C_TUTORIAL
  transition_in(function()
    dispatch_coroutine(co_delay(0.75, tut_show_movement))
  end)
end

function draw_tutorial()
  draw_puzzle_common(g_tutorial_state)

  print(g_tutorial_state.message, 1, 70, 7)

  if g_tutorial_state.row_runs_border then
    rect(24, 34, 35, 66, 11)
  end

  if g_tutorial_state.col_runs_border then
    rect(35, 24, 66, 37, 11)
  end
end

function update_tutorial()
end

function tut_animation(frames, dt, end_wait, callback)
  dispatch_coroutine(cocreate(function()
    delay(0.22)
    iter_delay(frames, dt, function(frame, i, is_last)
      if #frame == 2 then
        g_tutorial_state.x = frame[1]
        g_tutorial_state.y = frame[2]
      else
        if frame[1] then
          try_punch_puzzle_space(g_tutorial_state)

          if is_game_won(g_tutorial_state) then
            g_tutorial_state.is_win = true
          end
        else
          mark_puzzle_space(g_tutorial_state)
        end
      end

      if is_last then
        dispatch_coroutine(co_delay(end_wait, function()
          g_tutorial_state.message = ''
          g_tutorial_state.row_runs_border = false
          g_tutorial_state.col_runs_border = false
          dispatch_coroutine(co_delay(.5, callback))
        end))
      end
    end)
  end))
end

function tut_show_movement()
  g_tutorial_state.message = 'use ⬅️⬆️➡️⬇️ to move the pencil'

  tut_animation({
    { 2, 1 },
    { 3, 1 },
    { 3, 2 },
    { 3, 3 },
    { 2, 3 },
    { 1, 3 },
    { 1, 2 },
  }, 0.4, 2, tut_show_row_runs)
end

function tut_show_row_runs()
  g_tutorial_state.message = 'each number is a run of squares\nto punch. press ❎ to punch.'
  g_tutorial_state.row_runs_border = true

  tut_animation({
    { 2, 2 },
    { true },
    { 3, 2 },
    { 4, 2 },
    { true },
  }, 0.4, 2, tut_show_col_runs)
end

function tut_show_col_runs()
  g_tutorial_state.message = 'same deal for columns.'
  g_tutorial_state.col_runs_border = true

  tut_animation({
    { 4, 2 },
    { 4, 3 },
    { 4, 4 },
    { 4, 5 },
    { true },
  }, 0.4, 2, tut_show_long_row)
end

function tut_show_long_row()
  g_tutorial_state.message = 'bigger numbers mean longer\nspans.'

  tut_animation({
    { 3, 5 },
    { true },
    { 2, 5 },
    { true },
  }, 0.4, 2, tut_show_gaffe)
end

function tut_show_gaffe()
  g_tutorial_state.message = 'careful! punching the wrong\nspace will cost a gaffe!'

  tut_animation({
    { 2, 4 },
    { true },
  }, 0.5, 2.5, tut_show_mark)
end

function tut_show_mark()
  g_tutorial_state.message = 'press 🅾️ to mark or unmark a\nspace. marking does not affect\nthe game. use it however you\nlike!'

  tut_animation({
    { 2, 3 },
    { 1, 3 },
    { false },
    { 2, 3 },
    { false },
    { 3, 3 },
    { false },
    { 4, 3 },
    { false },
    { 5, 3 },
    { false },
  }, 0.5, 3, tut_finish_puzzle)
end

function tut_finish_puzzle()
  g_tutorial_state.message = 'that\'s all. have fun!'

  tut_animation({
    { 5, 4 },
    { true },
    { 4, 4 },
    { 3, 4 },
    { 2, 4 },
    { 1, 4 },
    { true },
  }, 0.5, 2, function()
    transition_out(function()
      init_main_menu()
    end)
  end)
end
