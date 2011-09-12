class CreatePhotos < ActiveRecord::Migration
  def change
  	create_table(:photos) do |t|
	  	t.string    :img_file_name
	    t.string 	:img_content_type
	    t.integer   :img_file_size
	    t.datetime  :img_updated_at
	end

  end
end
