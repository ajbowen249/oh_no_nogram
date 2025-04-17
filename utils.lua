function get_string_pixel_width(string)
  local width = 0
  for i = 1, #tostr(string) do
    width += ord(sub(string,i,i)) <= 127 and 4 or 8
  end

  return width
end

function get_string_block_info(string)
  local sp = split(string, '\n')
  local lines = {}
  for l in all(sp) do
    add(lines, get_string_pixel_width(l))
  end
  return lines
end

function get_list_runs(list)
  local run_length = 0
  local runs = {}
  for cell in all(list) do
    if cell then
      run_length += 1
    else
      if run_length > 0 then
        add(runs, run_length)
        run_length = 0
      end
    end
  end

  if run_length > 0 or #runs == 0 then
    add(runs, run_length)
  end

  return runs
end

function parse_puzzle(pstr)
  local sp = split(pstr, '|', false)
  local puz = { name = sp[1], size = tonum(sp[2]), image = {} }
  local ii = 1
  for ri=1, puz.size do
    local row = {}
    for ci=1, puz.size do
      add(row, sp[3][ii] == '1')
      ii += 1
    end

    add(puz.image, row)
  end

  return puz
end

function vertical_dotted_line(x, y1, y2, col1, col2)
  for y=y1,y2,2 do
    pset(x, y, col1)
    if y < y2 then
      pset(x, y+1, col2)
    end
  end
end

function horizontal_dotted_line(y, x1, x2, col1, col2)
  for x=x1,x2,2 do
    pset(x, y, col1)
    if x < x2 then
      pset(x+1, y, col2)
    end
  end
end

function transition_out(callback)
  dispatch_predraw_coroutine(cocreate(function()
    for coord = 0, 64, 16 do
      cls()
      local size = 127 - (coord * 2)
      clip(coord, coord, size, size)
      yield()
    end

    clip()
    callback()
  end))
end

function transition_in(callback)
  dispatch_predraw_coroutine(cocreate(function()
    for coord = 64, 0, -16 do
      cls()
      local size = 127 - (coord * 2)
      clip(coord, coord, size, size)
      yield()
    end

    clip()
    callback()
  end))
end

function draw_message_box_corners(y)
  circfill(4, y, 5, 7)
  circfill(123, y, 5, 7)
end

function draw_message_box(msg, y)
  local msg_info = get_string_block_info(msg)
  draw_message_box_corners(y + 2)
  local mid_y = y
  local width = msg_info[1]

  if #msg_info > 1 then
    mid_y = y + (#msg_info * 5)
    draw_message_box_corners(y + (#msg_info * 5), mid_y)

    for i=2,#msg_info do
      if msg_info[i] > width then
        width = msg_info[i]
      end
    end
  end


  rectfill(4, y - 4, 123, mid_y + 7, 7)

  if #msg_info > 1 then
    rectfill(0, y, 127, mid_y, 7)
  end

  local x = ((127 - width) / 2) + 1
  print(msg, x, y, 0)
end
