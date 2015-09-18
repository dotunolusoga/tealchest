Fabricator(:product) do
  name             { Faker::Name.name }
  description      { Faker::Lorem.characters(140) }
  price_cents      1
  color            { Faker::Commerce.color }
  amount_available 1
end
