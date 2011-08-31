class AddPhotoColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :cards, :photo_file_name,    :string
    add_column :cards, :photo_content_type, :string
    add_column :cards, :photo_file_size,    :integer
    add_column :cards, :photo_updated_at,   :datetime
  end
end
