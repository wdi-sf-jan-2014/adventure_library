class ChangeGuiDtoguidForAdventures < ActiveRecord::Migration
  def change
    rename_column :adventures, :GUID, :guid 
  end
end
