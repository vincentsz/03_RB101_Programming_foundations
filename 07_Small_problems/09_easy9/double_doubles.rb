def twice(integer)
  string = integer.to_s
  half = string.size / 2
  case 
    when string[0, half] == string[half, half] && half != 0
      integer
    else
      integer * 2
    end
  end

  twice(37) == 74
  twice(44) == 44
  twice(334433) == 668866
  twice(444) == 888
  twice(107) == 214
  twice(103103) == 103103
  twice(3333) == 3333
  twice(7676) == 7676
  twice(123_456_789_123_456_789) == 123_456_789_123_456_789
  twice(5) == 10