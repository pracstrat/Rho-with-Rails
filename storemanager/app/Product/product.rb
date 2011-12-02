# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Product
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Product.
  enable :sync

  #add model specifc code here
  property :image_uri, :blob

  def image_path
  	Rho::RhoApplication::get_blob_path(self.image_uri) rescue ''
  end
end
