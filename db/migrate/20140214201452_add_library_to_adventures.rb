class AddLibraryToAdventures < ActiveRecord::Migration
  def change
    add_reference :adventures, :library, index: true
  end
end
