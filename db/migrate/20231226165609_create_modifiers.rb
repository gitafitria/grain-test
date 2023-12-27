class CreateModifiers < ActiveRecord::Migration[7.1]
  def change
    create_table :modifiers, id: false, force: true do |t|
      t.references :item, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.references :modifier_group, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.integer :display_order
      t.integer :default_quantity
      t.float :price_override

      t.timestamps
    end
    add_index :modifiers, [:item_id, :modifier_group_id], unique: true
  end
end
