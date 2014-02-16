class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.belongs_to :adventure, index: true
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
