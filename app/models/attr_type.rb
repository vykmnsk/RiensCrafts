class AttrType < ActiveRecord::Base
	validates :name, :presence => true, :length => {:minimum => 3}, :uniqueness => true

	has_many :attrs
end
