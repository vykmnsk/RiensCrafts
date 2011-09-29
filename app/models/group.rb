class Group < ActiveRecord::Base
	attr_accessible :name

	validates :name, :presence => true, :length => {:minimum => 3}, :uniqueness => true

	has_many :items
	has_many :labels
end