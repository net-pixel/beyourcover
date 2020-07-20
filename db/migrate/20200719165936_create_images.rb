class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :item, null: false
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
