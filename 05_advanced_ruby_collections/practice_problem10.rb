original = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
original.map do |hash|
  incremented_hash = {}
  hash.each do |key, integer|
    incremented_hash[key] = integer + 1
  end
  incremented_hash
end

#each with object
original = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
original.each_with_object([]) do |hash, array|
  incremented_hash = {}
  hash.each do |key, value|
    incremented_hash[key] = value + 1
  end
  array << incremented_hash
end