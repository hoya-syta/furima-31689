class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname,            :string,   null: false
    add_column :users, :last_name,           :string,   null: false
    add_column :users, :first_name,          :string,   null: false
    add_column :users, :last_name_hurigana,  :string,   null: false
    add_column :users, :first_name_hurigana, :string,   null: false
    add_column :users, :birthday,            :datetime, null: false
  end
end
