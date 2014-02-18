class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.belongs_to :library, index: true
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
