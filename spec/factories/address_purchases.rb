FactoryBot.define do
  factory :address_purchase do
    postal_code     { '123-4567' }
    prefectures_id  { '3' }
    municipalities  { '渋谷区' }
    address         { '青山1-1' }
    house_number    { '青山ビル1-2' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
    user_id         {'1'}
    item_id         {'2'}
  end
end
