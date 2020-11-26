class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category    
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_zone
  belongs_to :delivery_zone
  belongs_to :delivery_time


  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_explain
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :delivery_zone_id
      validates :delivery_time_id
    end
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
