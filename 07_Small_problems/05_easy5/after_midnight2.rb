=begin
1.Understand problem
Input: A certain hour in the following 24h format: "00:00"
Output: The number of minutes before and after midnight, respectively.
2.Examples
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
3.Data structure

4.Algorithm
After midnight
Store the two first digits in a variable hours, convert to integer. Store the two last digits in a variable minutes, convert to integer.
Multiply variable hours with constant HOUR( = 60). Add minutes to result. Perform modulo DAY (=1440) Output result
Before midnight
Subtract result method before_midnight from constant DAY ( =1440). Perform modulo DAY (=1440) Output result
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time)
  hours = time[0..1].to_i
  minutes = time[3..4].to_i

  total_minutes = (hours * MINUTES_PER_HOUR) + minutes
  total_minutes % MINUTES_PER_DAY
end

def before_midnight(time)
  (MINUTES_PER_DAY - after_midnight(time)) % MINUTES_PER_DAY
end

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

#further exploration

def after_midnight(time)
  hours = time[0..1].to_i
  minutes = time[3..4].to_i
  time = Time.new(2020,10,11,hours,minutes)
  (time.hour * 60 + time.min) % 1440 
end

def before_midnight(time)
  (1440 - after_midnight(time)) % 1440
end

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

