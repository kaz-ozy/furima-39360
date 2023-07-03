FactoryBot.define do
  factory :item do
    
    name            {"ゲーム"}
    explanation     {"楽しい"}
    price           {4000}
    category_id     {2}
    condition_id    {3}
    charge_id       {2}
    prefecture_id   {2}
    days_ship_id    {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
