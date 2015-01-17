class Listing < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x200>" }, :default_url => "noimage.png"
 	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
