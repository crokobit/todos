Fabricator(:user) do
  name {Faker::Name.name}
  password "password"
end
