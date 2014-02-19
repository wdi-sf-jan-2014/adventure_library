class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :title
      t.string :author
      t.string :guid
      t.integer :library_id

      t.timestamps
    end
  end
end
