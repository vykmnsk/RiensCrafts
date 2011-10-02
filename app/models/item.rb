class Item < ActiveRecord::Base
	attr_accessible :name, :descr, :price, :photos_attributes

	validates :name, :presence => true, :length => {:minimum => 4}

	belongs_to :group
	has_many :attrs
	has_many :photos, :dependent => :destroy
	has_and_belongs_to_many :labels

	accepts_nested_attributes_for :attrs, 
									:reject_if => lambda { |a| a[:detail].blank? },
									:allow_destroy => true

	accepts_nested_attributes_for :photos, 
									:reject_if => lambda { |a| a[:img].blank? },
									:allow_destroy => true

end