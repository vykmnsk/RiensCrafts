class ChangePhotos < ActiveRecord::Migration
  def change
  	change_table :photos do |t|
  		t.references :item
  	end
  end

end
