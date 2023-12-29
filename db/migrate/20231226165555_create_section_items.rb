class CreateSectionItems < ActiveRecord::Migration[7.1]
  def change
    create_table :section_items do |t|
      t.references :section, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.references :item, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.integer :display_order, default: 0

      t.timestamps
    end
    # add_index :section_items, [:section_id, :item_id], unique: true
  end
end
