class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :name
      t.text :text

      t.timestamps

      t.belongs_to :adventure
    end
  end
end
