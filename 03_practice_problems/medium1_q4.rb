def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end


# yes there is a difference, in the first scenario the caller is modified, so the objet idea stays the same when an alement is added. In the second case, reassignment is non-destructive, so each time the code gets executed, a new object and object id will be createdc