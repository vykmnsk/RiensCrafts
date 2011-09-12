class Photo < ActiveRecord::Base
	has_attached_file :img, :styles => { :medium => "200x200>" } #:thumb => "100x100>" 

	belongs_to :item
end