class Card < ActiveRecord::Base
	validates :name, :presence => true, :length => {:minimum => 4}

	#has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	attr_accessible :name

end