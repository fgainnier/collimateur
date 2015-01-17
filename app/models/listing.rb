class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x200>" }, :default_url => "noimage.png"
		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	else
		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x200>" }, :default_url => "noimage.png", 
		:storage => :dropbox, 
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		:path => ":style/:id_:filename"
 		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
 	end
end
