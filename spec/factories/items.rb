FactoryBot.define do
  factory :item do
    item_name         { 'aaa' }
    item_explain      { 'aaa' }
    category_id       { '2' }
    status_id         { '2' }
    delivery_fee_id   { '2' }
    delivery_zone_id  { '2' }
    delivery_time_id  { '2' }
    price             { '12345' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
