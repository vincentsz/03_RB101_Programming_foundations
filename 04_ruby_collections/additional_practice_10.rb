munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age_group = ["kid", "adult", "senior"]

munsters.each do |_, hash|
  
  case hash["age"]
  when 0..17
    hash["age_group"] = age_group[0]
  when 18..64
    hash["age_group"] = age_group[1]
  else       
    hash["age_group"] = age_group[2]
  end

end

munsters
 