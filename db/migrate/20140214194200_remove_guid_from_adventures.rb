class RemoveGuidFromAdventures < ActiveRecord::Migration
  def change
    remove_column :adventures, :GUID, :string
  end
end
