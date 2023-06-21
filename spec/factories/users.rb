FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    
    password_confirmation {password}
    last_name             {'西'}
    first_name             {'久'}
    last_name_kana        {'ニシ'}
    first_name_kana       {'ヒサシ'}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}

  end
end