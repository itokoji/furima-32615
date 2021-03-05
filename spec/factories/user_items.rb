FactoryBot.define do
  factory :user_item do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    addresses { '1-1' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    building { '柳ビル' }
  end
end