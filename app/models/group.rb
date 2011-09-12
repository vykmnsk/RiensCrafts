class Group < ActiveRecord::Base
	attr_accessible :name

	validates :name, :presence => true, :length => {:minimum => 3}

	has_many :items
end