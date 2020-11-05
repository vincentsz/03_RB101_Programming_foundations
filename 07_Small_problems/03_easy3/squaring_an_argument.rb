def multiply(number1,number2)
  number1 * number2
end

def square(number)
  multiply(number,number)
end

def power_to_n(n,p)
  multiply(n, n**(p-1))
end



power_to_n(2, 3)

def power_to_nth(num, pow)
  product = 1
  if pow > 0
  pow.times { product = multiply (product, num) }
  else
  (-pow).times { product = multiply (product, 1/num.to_f) }
  end
  product
end

