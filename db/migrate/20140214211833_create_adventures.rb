class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.references :library
      t.string :title
      t.string :author
      t.string :guid

      t.timestamps
    end
  end
end
