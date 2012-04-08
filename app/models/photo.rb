class Photo < ActiveRecord::Base

	if Rails.env.production?
		has_attached_file :img, 
			:styles => { :medium => "200x200>", :thumb => "120x120" },
		    :storage => :s3,
		    :bucket => ENV['S3_BUCKET_NAME'],
		    :s3_credentials => {
		    	:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
		    	:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
		    }
	else 
		has_attached_file :img, 
			:styles => { :medium => "200x200>", :thumb => "120x120" }
	end  

	belongs_to :item
end