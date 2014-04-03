class AddGuidToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :guid, :string
  end
end
