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

function tut_show_movement()
  g_tutorial_state.message = 'use ⬅️⬆️➡️⬇️ to move the pencil'

  dispatch_coroutine(co_delay(0.25, function()
    dispatch_coroutine(co_animate({
      { 2, 1 },
      { 3, 1 },
      { 3, 2 },
      { 3, 3 },
      { 2, 3 },
      { 1, 3 },
      { 1, 2 },
    }, .4, function(pos, i, is_last)
      g_tutorial_state.x = pos[1]
      g_tutorial_state.y = pos[2]

      if is_last then
        dispatch_coroutine(co_delay(2, function()
          g_tutorial_state.message = ''
          dispatch_coroutine(co_delay(.5, tut_show_row_runs))
        end))
      end
    end))
  end))
end

function tut_show_row_runs()
  g_tutorial_state.message = 'each number is a run of squares\nto punch. press ❎ to punch.'
  g_tutorial_state.row_runs_border = true

  -- eeewwwww. Whatever; it works. Nested co_animate is causing issues.
  dispatch_coroutine(co_delay(0.5, function()
    dispatch_coroutine(co_delay(0.5, function()
      g_tutorial_state.x = 2
      g_tutorial_state.y = 2

      dispatch_coroutine(co_delay(0.5, function()
        try_punch_puzzle_space(g_tutorial_state)

        dispatch_coroutine(co_delay(0.5, function()
          g_tutorial_state.x = 3

          dispatch_coroutine(co_delay(0.5, function()
            g_tutorial_state.x = 4

            dispatch_coroutine(co_delay(0.5, function()
              try_punch_puzzle_space(g_tutorial_state)

              dispatch_coroutine(co_delay(1, function()
                g_tutorial_state.message = ''
                g_tutorial_state.row_runs_border = false
                dispatch_coroutine(co_delay(.5, tut_show_col_runs))
              end))
            end))
          end))
        end))
      end))
    end))
  end))
end

function tut_show_col_runs()
  g_tutorial_state.message = 'same deal for columns.'
  g_tutorial_state.col_runs_border = true

  dispatch_coroutine(co_delay(0.5, function()
    dispatch_coroutine(co_delay(0.5, function()
      g_tutorial_state.y = 3

      dispatch_coroutine(co_delay(0.5, function()
        g_tutorial_state.y = 4

          dispatch_coroutine(co_delay(0.5, function()
            g_tutorial_state.y = 5

          dispatch_coroutine(co_delay(0.5, function()
            try_punch_puzzle_space(g_tutorial_state)

            dispatch_coroutine(co_delay(1, function()
              g_tutorial_state.message = ''
              g_tutorial_state.col_runs_border = false
              dispatch_coroutine(co_delay(.5, tut_show_long_row))
            end))
          end))
        end))
      end))
    end))
  end))
end

function tut_show_long_row()
  g_tutorial_state.message = 'bigger numbers mean longer\nspans.'

  dispatch_coroutine(co_delay(0.5, function()
    dispatch_coroutine(co_delay(0.5, function()
      g_tutorial_state.x = 3

      dispatch_coroutine(co_delay(0.5, function()
        try_punch_puzzle_space(g_tutorial_state)

          dispatch_coroutine(co_delay(0.5, function()
            g_tutorial_state.x = 2

          dispatch_coroutine(co_delay(0.5, function()
            try_punch_puzzle_space(g_tutorial_state)

            dispatch_coroutine(co_delay(1, function()
              g_tutorial_state.message = ''
              dispatch_coroutine(co_delay(.5, tut_show_gaffe))
            end))
          end))
        end))
      end))
    end))
  end))
end

function tut_show_gaffe()
  g_tutorial_state.message = 'careful! punching the wrong\nspace will cost a gaffe!'

  dispatch_coroutine(co_delay(0.5, function()
    dispatch_coroutine(co_delay(0.5, function()
      g_tutorial_state.y = 4

      dispatch_coroutine(co_delay(0.5, function()
        try_punch_puzzle_space(g_tutorial_state)

        dispatch_coroutine(co_delay(2, function()
          g_tutorial_state.message = ''
          dispatch_coroutine(co_delay(.5, tut_show_mark))
        end))
      end))
    end))
  end))
end

function tut_show_mark()
  g_tutorial_state.message = 'press 🅾️ to mark or unmark a\nspace. marking does not affect\nthe game.'

  dispatch_coroutine(co_delay(0.5, function()
    g_tutorial_state.y = 3

    dispatch_coroutine(co_delay(0.5, function()
      mark_puzzle_space(g_tutorial_state)

      dispatch_coroutine(co_delay(0.5, function()
        g_tutorial_state.x = 3

        dispatch_coroutine(co_delay(0.5, function()
          mark_puzzle_space(g_tutorial_state)

          dispatch_coroutine(co_delay(3, function()
            g_tutorial_state.message = ''
            dispatch_coroutine(co_delay(.5, tut_finish_puzzle))
          end))
        end))
      end))
    end))
  end))
end

function tut_finish_puzzle()
  dispatch_coroutine(co_delay(0.5, function()
    dispatch_coroutine(co_delay(0.5, function()
      g_tutorial_state.x = 2

      dispatch_coroutine(co_delay(0.5, function()
        g_tutorial_state.x = 1

        dispatch_coroutine(co_delay(0.5, function()
          g_tutorial_state.y = 4

          dispatch_coroutine(co_delay(0.5, function()
            try_punch_puzzle_space(g_tutorial_state)

            dispatch_coroutine(co_delay(0.5, function()
              g_tutorial_state.x = 2

              dispatch_coroutine(co_delay(0.5, function()
                g_tutorial_state.x = 3

                dispatch_coroutine(co_delay(0.5, function()
                  g_tutorial_state.x = 4

                  dispatch_coroutine(co_delay(0.5, function()
                    g_tutorial_state.x = 5

                    dispatch_coroutine(co_delay(0.5, function()
                      try_punch_puzzle_space(g_tutorial_state)
                      g_tutorial_state.is_win = true

                      dispatch_coroutine(co_delay(.5, function()
                        g_tutorial_state.message = 'that\'s all. have fun!'
                        dispatch_coroutine(co_delay(4, function()
                          transition_out(function()
                            init_main_menu()
                          end)
                        end))
                      end))
                    end))
                  end))
                end))
              end))
            end))
          end))
        end))
      end))
    end))
  end))
end
