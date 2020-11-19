
FactoryBot.define do
  factory :user do
    nickname { 'test-user' }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { '阿あア' }
    first_name { '阿あア' }
    last_kana { 'カタカナ' }
    first_kana { 'カタカナ' }
    birthday { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end