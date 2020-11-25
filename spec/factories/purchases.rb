FactoryBot.define do
  factory :purchase do
    postal_code { '111-2222' }
    prefecture_id { Faker::Number.between(from: 2, to: 3) }
    city { '京都市' }
    building { 'ハイツ' }
    address { '1-2-3' }
    phone_number { '08000000000' }
  end
end
