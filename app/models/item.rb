class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_explain
    validates :price,format: { with: /\A[0-9]+\z/ },
                     length: { in: 300..9999999 }

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
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :delivery_fee, :delivery_zone, :delivery_time
end




