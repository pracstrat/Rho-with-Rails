class AddImageUriToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :image_uri, :string
  end
end
