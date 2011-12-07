# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Item
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Item.
  enable :sync

  belongs_to :product_id, 'Product'

  #add model specifc code here
end
