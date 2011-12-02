class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :brand
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.string :sku

      t.timestamps
    end
  end
end
