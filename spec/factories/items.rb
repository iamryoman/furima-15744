FactoryBot.define do
  factory :item do
    item_name                 { Faker::Name.name }
    item_description          { Faker::Name.name }
    category_id               { Faker::Number.between(from: 2, to: 3) }
    condition_id              { Faker::Number.between(from: 2, to: 3) }
    shipping_charge_id        { Faker::Number.between(from: 2, to: 3) }
    prefecture_id             { Faker::Number.between(from: 2, to: 3) }
    days_to_ship_id           { Faker::Number.between(from: 2, to: 3) }
    price                     { Faker::Number.between(from: 300, to: 9_999_999) }
    user
  end
end
