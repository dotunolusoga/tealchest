Fabricator(:user) do
  name         { Faker::Name.name }
  address      { Faker::Address.street_address }
  city         { Faker::Address.city }
  country      { Faker::Address.country }
  postal_code  { Faker::Address.postcode }
  email        { Faker::Internet.email }
  password     { Faker::Internet.password(8) }
  admin        false
end
