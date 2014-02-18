class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.text :title
      t.text :author
      t.text :guid

      t.timestamps
    end
  end
end
