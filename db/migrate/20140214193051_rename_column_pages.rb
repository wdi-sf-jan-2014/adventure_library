class RenameColumnPages < ActiveRecord::Migration
  def change
    rename_column :pages, :body, :text
  end
end
