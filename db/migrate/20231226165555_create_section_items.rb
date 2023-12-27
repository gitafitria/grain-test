class CreateSectionItems < ActiveRecord::Migration[7.1]
  def change
    create_table :section_items, id: false, force: true do |t|
      t.references :section, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.references :item, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.integer :display_order

      t.timestamps
    end
    add_index :section_items, [:section_id, :item_id], unique: true
  end
end
