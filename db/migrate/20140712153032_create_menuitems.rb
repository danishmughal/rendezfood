class CreateMenuitems < ActiveRecord::Migration
  def change
    create_table :menuitems do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
