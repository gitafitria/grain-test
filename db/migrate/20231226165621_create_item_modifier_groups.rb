class CreateItemModifierGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :item_modifier_groups, id: false, force: true do |t|
      t.references :item, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.references :modifier_group, null: false, foreign_key: { primary_key: :identifier }, type: :string

      t.timestamps
    end
    add_index :item_modifier_groups, [:item_id, :modifier_group_id], unique: true
  end
end
