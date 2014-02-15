class ChangeColumnNamePages < ActiveRecord::Migration
  def change
    change_column :pages, :body, :text
  end
end
