FactoryBot.define do
  factory :item do
    item_name                   { Faker::Base.regexify('[あ]{2}') }
    explanation                 { Faker::Base.regexify('[あ]{2}') }
    category_id                 { Faker::Number.between(from: 2, to: 11) }
    condition_id                { Faker::Number.between(from: 2, to: 3) }
    shipping_charge_id          { Faker::Number.between(from: 2, to: 3) }
    prefecture_id              { Faker::Number.between(from: 2, to: 3) }
    purchase_to_day_id          { Faker::Number.between(from: 2, to: 3) }
    value                       { Faker::Number.between(from: 300, to: 3000) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
