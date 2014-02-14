class AddGuidToAdventure < ActiveRecord::Migration
  def change
    add_column :adventures, :guid, :string
  end
end
