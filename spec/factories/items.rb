FactoryBot.define do
  factory :item do
    item_info {Faker::Lorem.sentence}
    category_id {Faker::Lorem.sentence}
    sales_status_id {Faker::Lorem.sentence}
    shipping_fee_status_id {Faker::Lorem.sentence}
    prefecture_id {Faker::Lorem.sentence}
    scheduled_delovery_id {Faker::Lorem.sentence}
    item_price {Faker::Lorem.sentence}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
