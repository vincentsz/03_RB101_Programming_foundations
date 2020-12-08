SCORES = {
'A' => (90..100),
'B' => (80..89),
'C' => (70..79),
'D' => (60..69),
'E' => (0..59)
}

def get_grade(score1, score2, score3)
  mean_average = (score1 + score2 + score3) / 3
  SCORES.each do |score, range|
    if range.include?(mean_average)
      return score
    end
  end
end

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

#textbook solution
def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3) / 3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

#further exploration
def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3) / 3

  case 
  when result < 60   then 'F'
  when result < 70   then 'D'
  when result < 80   then 'C'
  when result < 90   then 'B'
  when result < 100   then 'A'
  else              'A+'
  end
end

get_grade(95, 90, 93) 
get_grade(50, 50, 95) 
get_grade(100, 102, 105) 
