class AddNameToLibrariesModel < ActiveRecord::Migration
  def change
    change_table :libraries do |t|
      t.string :name
    end
  end
end
