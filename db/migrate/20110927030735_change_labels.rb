class ChangeLabels < ActiveRecord::Migration
  def change
  	change_table :labels do |t|
  		t.references :group
  	end
  end
end