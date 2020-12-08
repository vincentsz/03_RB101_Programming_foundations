[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |element|
    if element.to_s.size == 1
      element + 1
    else
      element.map do |num|
        num + 1 
      end
    end
  end
end

[[1], [2], [3], [4]].partition do |element3|
  element3.size > 0
end