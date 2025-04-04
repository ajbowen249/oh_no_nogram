function get_string_pixel_width(string)
  local width = 0
  for i = 1, #tostr(string) do
    width += ord(sub(string,i,i)) <= 127 and 4 or 8
  end

  return width
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
  local puz = { name = sp[1], image = {} }
  local size = tonum(sp[2])
  local ii = 1
  for ri=1, size do
    local row = {}
    for ci=1, size do
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
