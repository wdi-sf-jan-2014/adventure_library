class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :body
      t.references :adventure, index: true

      t.timestamps
    end
  end
end
