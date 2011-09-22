class Attr < ActiveRecord::Base
	validates :detail, :presence => true, :length => {:minimum => 3}

	belongs_to :item
	belongs_to :attr_type
end
