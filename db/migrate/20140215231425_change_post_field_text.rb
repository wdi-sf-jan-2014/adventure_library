class ChangePostFieldText < ActiveRecord::Migration
  def change
  	change_column :pages, :text, :text
  end
end
