Fabricator(:todo) do
  do_what {Faker::Name.name}
end

Fabricator(:tag) do
  name { sequence(:name){|i| "tag#{i}"} } 
end
