FactoryBot.define do
  factory :user_item do
    #user_id {1}
    #item_id {1}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    addresses { '1-1' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    building {nil}
  end
end