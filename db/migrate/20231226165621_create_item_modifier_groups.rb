class CreateItemModifierGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :item_modifier_groups do |t|
      t.references :item, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.references :modifier_group, null: false, foreign_key: { primary_key: :identifier }, type: :string

      t.timestamps
    end
  end
end
