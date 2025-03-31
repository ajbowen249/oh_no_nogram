function get_string_pixel_width(string)
  local width = 0
  for i = 1, #tostr(string) do
    width += ord(sub(string,i,i)) <= 127 and 4 or 8
  end

  return width
end
