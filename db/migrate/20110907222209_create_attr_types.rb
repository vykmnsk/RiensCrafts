class CreateAttrTypes < ActiveRecord::Migration
  def change
    create_table :attr_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
