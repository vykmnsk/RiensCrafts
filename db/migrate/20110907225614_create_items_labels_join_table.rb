class CreateItemsLabelsJoinTable < ActiveRecord::Migration
  def change
  	create_table :items_labels, :id => false do |t|
  		t.references :item, :null => false
  		t.references :label, :null => false
  	end
  end
end
