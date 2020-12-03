class AddressPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipalities, :address, :house_number, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipalities
    validates :address
    validates :phone_number,  length: { maximum: 11 },
                              format: { with: /\A[0-9]+\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities, house_number: house_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end
