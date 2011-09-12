class CreateItems < ActiveRecord::Migration
  def change
    create_table(:items) do |t|
      	t.string :name, :null => false 
    	t.string :descr
    	t.decimal :price, :precision => 8, :scale => 2
      	t.timestamps
  	end
  end

end
