class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :destination_last,          null: false
      t.string :destination_first,         null: false
      t.string :destination_last_kana,          null: false
      t.string :destination_first_kana,         null: false
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false, foreign_key: true
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone_number
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :addresses, :prefecture_id
    add_index :addresses, :city
  end
end
