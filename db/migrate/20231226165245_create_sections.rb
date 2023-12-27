class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections, id: false, force: true do |t|
      t.string :identifier, primary_key: true
      t.string :label
      t.string :description
      t.integer :display_order

      t.timestamps
    end
    add_index :sections, [:identifier], unique: true
  end
end
