=begin
1.Understand problem
Input: An integer, positive, negative or 0, representing minutes after or before midnight
Output: Time of day in 24 hour format (hh:mm)
2.Examples
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
3.Data structure

4.Algorithm
Set a constant of 1440 minutes ( = 24h). Calculate modulo 1440 for the input. This reduses the reult to the smallest number. The call divmod(60) on the result, this will give you the hours and minutes in an array. Iterate over array to print on screen.

=end

def time_of_day(time)
  minutes = time % 1440
  array = minutes.divmod(60)

  if (0..9).include?(array[0])
    array[0] = "0" + array[0].to_s
  else
    array[0] = array[0].to_s
  end

  if (0..9).include?(array[1])
    array[1] = "0" + array[1].to_s
  else
    array[1] = array[1].to_s
  end

  "#{array[0]}:#{array[1]}"
end

time_of_day(0) 
time_of_day(-3) 
time_of_day(35) 
time_of_day(-1437)
time_of_day(3000) 
time_of_day(800) 
time_of_day(-4231) 

#textbook solution
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  days, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
 
  sprintf("%02d:%02d", hours, minutes)
end

time_of_day(0) 
time_of_day(-3) 
time_of_day(35) 
time_of_day(-1437)
time_of_day(3000) 
time_of_day(800) 
time_of_day(-4231) 


# further exploration

=begin
1.Understand problem
Rules: Delta minutes is the number of minutes before or after midnight between Saturday and Sunday. #Date and #Time classes are allowed.
Input: delta minutes
Output: Day, Hour:minutes
2.Examples
time_of_day(-4231) == "Thursday 01:29"
3.Data structure

4.Algorithm

=end

WEEK_KEY = {0 => "Sunday", 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 5 => "Friday", 6 => "Saturday"}
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
DAYS_PER_WEEK = 7
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
MINUTES_PER_WEEK = MINUTES_PER_DAY * DAYS_PER_WEEK

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_WEEK
  days, minutes = delta_minutes.divmod(MINUTES_PER_DAY)
  hours, minutes = minutes.divmod(MINUTES_PER_HOUR)
  sprintf("%s:%02d:%02d", WEEK_KEY[days], hours, minutes)
end


time_of_day(-4231)

def time_of_day(delta_minutes)
  delta_seconds = delta_minutes * 60
  time = Time.new(2020, 10, 11,0, 0, 0) + delta_seconds
  time.strftime("%A %02k:%M")
end

time_of_day(-4231)