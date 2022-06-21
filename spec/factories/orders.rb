FactoryBot.define do
  factory :order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-1234' }
    prefecture_id { '5' }
    municipalities { '東京都多摩市南野' }
    address { '5-4-4-4' }
    building_name { 'ハイツ' }
    telephone_number { '09087654321' }
    purchase_history_id { '5' }
  end
end
