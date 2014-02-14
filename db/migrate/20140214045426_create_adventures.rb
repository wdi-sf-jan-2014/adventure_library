class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.belongs_to :library
      t.string :title
      t.string :author
      t.string :guid

      t.timestamps
    end
  end
end
