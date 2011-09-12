class ChangeItems < ActiveRecord::Migration
  def change
  	change_table :items do |t|
  		t.references :group
  	end
  end
end
