class Label < ActiveRecord::Base
		has_and_belongs_to_many :items#, :unique => true
		belongs_to :group

		validates :group_id, :presence => true
		validates :name, :presence => true, :length => {:minimum => 3}
end
