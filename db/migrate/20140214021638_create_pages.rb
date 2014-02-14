class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :body
      t.string :guid
      t.references :adventure, index: true
      t.belongs_to :pageable, polymorphic: true

      t.timestamps
    end
    add_index :pages, [:pageable_id, :pageable_type]
  end
end
