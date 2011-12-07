class Product < ActiveRecord::Base
	after_find :set_image_uri
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :url => '/system/:class/:attachment/:id/:style/:filename'
	has_many :items, :dependent=>:destroy
	private
	def set_image_uri		
		uri = self.avatar.present? ? self.avatar.url.gsub!(/\?.*$/, '') : nil
		update_attribute(:image_uri, uri)
	end
end
