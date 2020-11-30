class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :items
  has_one :address
end
