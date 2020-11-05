def staggered_case(string)
  result =''
  need_upper = true
  string.chars.each do |char|
    
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    
    need_upper = !need_upper if char =~ /[a-zA-z]/
  end
  result
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'