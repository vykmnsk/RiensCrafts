class AttrsBelong2item < ActiveRecord::Migration
  def change
  	change_table :attrs do |t|
  		t.references :item
  	end
  end

end
