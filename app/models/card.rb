class Card < ActiveRecord::Base
	validates :name, :presence => true, :length => {:minimum => 4}, :uniqueness => true

	has_attached_file :photo, :styles => { :medium => "200x200>" } #:thumb => "100x100>" 
end