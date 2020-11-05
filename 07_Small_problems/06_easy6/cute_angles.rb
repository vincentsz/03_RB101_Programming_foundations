=begin
1.Understand problem
Input:a floating point number (representing an angle between 0° and 360°)
Output:a string that represents that angle in degrees, minutes and seconds
Rules:
-Explicit:
  - a ° degree symbol represents degrees, ' represents minutes, '' represents seconds
  - a degree has 60 minutes, a minute has 60 seconds
  - results should be within two seconds of results shown
  - when formatting the minutes and seconds you should use two digit numbers with leading zeros
  -this constant may be used to represent the dgree symbol:
    DEGREE = "\xC2\xB0"
-Implicit:
-Question: do we need to avoid Ruby's floats imprecision (no)
2.Examples
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

3.Data structure

4.Algorithm
Retrieve quotient and modulus of a division by 1. 
Store in an array. 
Set first value in array to variable degrees. 
Set second value in array to variable minutes. 
Multiply minutes by 60. 
Retrieve quotients and modulus of a division by 1.
Store in array
Set first value in array to variable minutes. 
Pad minutes with 0
Set second value in array to variable seconds.
Multiply seconds by 60.
Round seconds to the 1.
Pad seconds with 0
Print in format: %(degrees°minutes'seconds")

=end
DEGREE = "\xC2\xB0"
def dms(float)
  float %= 360
  degrees, remaining_minutes = float.divmod(1)
  minutes, remaining_seconds = (remaining_minutes * 60).divmod(1)
  minutes = minutes.to_s.rjust(2, "0")
  seconds = (remaining_seconds * 60).round.to_s.rjust(2, "0")
  %(#{degrees}°#{minutes}'#{seconds}")
end

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
dms(400) == %(40°00'00")
dms(-40) == %(320°00'00")
dms(-420) == %(300°00'00")

#textbook solution

DEGREE = "\xC2\xB0"
SECONDS_IN_MINUTE = 60
MINUTES_IN_DEGREE = 60
SECONDS_IN_DEGREE = SECONDS_IN_MINUTE * MINUTES_IN_DEGREE

def dms(float)
  float %= 360

  total_seconds = float * SECONDS_IN_DEGREE
  resulting_minutes, seconds = total_seconds.divmod(SECONDS_IN_MINUTE)
  degrees, minutes = resulting_minutes.divmod(MINUTES_IN_DEGREE)
  seconds = seconds.round
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
dms(400) == %(40°00'00")
dms(-40) == %(320°00'00")
dms(-420) == %(300°00'00")