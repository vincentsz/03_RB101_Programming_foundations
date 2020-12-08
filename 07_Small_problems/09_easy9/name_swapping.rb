def swap_name(name)
  names = name.split
  "#{names[1]}, #{names[0]}"
end

swap_name('Joe Roberts') == 'Roberts, Joe'