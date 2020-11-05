hash = {"test" => 3, "thing" => 4}
hash.select do |key, value|
  key.size > 5
end

mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]
countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}


def begins_with_b(string)
  string[0] == 'B'
end

countries_and_capitals.select do |country, capital|
  begins_with_b(country)
end # => {"Belgium"=>"Brussels", "Barbados"=>"Bridgetown", "Bolivia"=>"La Paz", "Brazil"=>"Brasilia"}


def begins_with_b(string)
  string[0] == 'B'
end 

countries_and_capitals.find_all do |country, capital|
  begins_with_b(country)
end # => [["Belgium", "Brussels"], ["Barbados", "Bridgetown"], ["Bolivia", "La Paz"], ["Brazil", "Brasilia"]]

def begins_with_b(string)
  string[0] == 'B'
end 

countries_and_capitals.filter do |country, capital|
  begins_with_b(country)
end # => {"Belgium"=>"Brussels", "Barbados"=>"Bridgetown", "Bolivia"=>"La Paz", "Brazil"=>"Brasilia"}