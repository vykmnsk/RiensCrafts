class Item < ActiveRecord::Base
	attr_accessible :name, :descr, :price, :photos_attributes

	validates :name, :presence => true, :length => {:minimum => 4}

	has_many :photos, :dependent => :destroy
	has_many :attrs
	has_and_belongs_to_many :labels

	accepts_nested_attributes_for :photos, 
									:reject_if => lambda { |a| a[:img].blank? },
									:allow_destroy => true

end