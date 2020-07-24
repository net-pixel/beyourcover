class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.string :brand
      t.integer :price, null: false
      t.integer :category_id
      t.string :postage, null: false
      t.integer :prefecture_id, null: false
      t.string :shipping_day, null: false
      t.integer :user_id, null: false
      t.integer :buyer_id
      t.timestamps
    end
    add_index :products, :name
    add_index :products, :price
  end
end
