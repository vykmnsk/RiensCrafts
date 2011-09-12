class CreateAttrs < ActiveRecord::Migration
  def change
    create_table :attrs do |t|
      t.string :detail
      t.references :attr_type

      t.timestamps
    end
  end
end
