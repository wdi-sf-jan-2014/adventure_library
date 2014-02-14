class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :text
      t.belongs_to :adventure
      t.belongs_to :pageable, polymorphic: true

      t.timestamps
      add_index :pages, [:pageable_id, :pageable_type]

    end
  end
end
