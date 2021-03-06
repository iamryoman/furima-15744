FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-1234' }
    prefecture_id { '5' }
    municipalities { '東京都多摩市南野' }
    address { '5-4-4-4' }
    building_name { 'ハイツ' }
    telephone_number { '08036365863' }
    user_id { '5' }
    item_id { '8' }
  end
end
