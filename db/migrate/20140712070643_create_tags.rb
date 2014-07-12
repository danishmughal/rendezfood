class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name

      t.belongs_to :poll

      t.timestamps
    end
  end
end
