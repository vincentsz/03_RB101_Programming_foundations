def center_of(string)
  size = string.size
  case 
    when size.odd?
      string[size/2]
    else
       string[(size/2)-1] + string[size/2]
    end
end

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'