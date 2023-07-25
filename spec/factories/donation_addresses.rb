FactoryBot.define do
  factory :donation_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '横浜緑区' }
    address { '青山1-1' }
    building { '東京ハイツ' }
    telephone_number { '04012345678' }
    token {'a'}
    user_id { }
    item_id { }
  end
end
