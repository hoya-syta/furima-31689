class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,     default: "",  null: false
      t.integer    :prefectures_id,                null: false
      t.string     :municipalities,  default: "",  null: false
      t.string     :address,         default: "",  null: false
      t.string     :house_number,    default: "",  null: false
      t.string     :phone_number,    default: "",  null: false
      t.references :user,                          null: false,  foreign_key: true
      t.references :item,                          null: false,  foreign_key: true

      t.timestamps
    end
  end
end
