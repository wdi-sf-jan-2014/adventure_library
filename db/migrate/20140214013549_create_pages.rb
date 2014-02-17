class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :text
      t.belongs_to :adventure

      t.timestamps

    end
  end
end
