class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.string :brand
      t.integer :price, null: false
      t.integer :category_id
      t.string :postage, null: false
      t.integer :stock, null: false
      t.references :user
      t.timestamps
    end
    add_index :products, :name
    add_index :products, :price
  end
end
