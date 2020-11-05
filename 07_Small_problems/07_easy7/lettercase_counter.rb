def letter_case_count(string)
  lettercase_count = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars do |char|
    if ("a".."z").include?(char)
      lettercase_count[:lowercase] += 1
    elsif ("A".."Z").include?(char)
      lettercase_count[:uppercase] += 1
    else
      lettercase_count[:neither] += 1
    end
  end
  lettercase_count
end

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

#textbook solution

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  string.each_char do |char|
    if UPPERCASE_CHARS.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

#textbook solution 1

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if UPPERCASE_CHARS.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

#textbook solution 2

def letter_cas_count(string)
  counts = {}

  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/}
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/}
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/}
  counts
end

