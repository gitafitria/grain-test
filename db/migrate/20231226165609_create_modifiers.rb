class CreateModifiers < ActiveRecord::Migration[7.1]
  def change
    create_table :modifiers do |t|
      t.references :item, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.references :modifier_group, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.integer :display_order, default: 0
      t.integer :default_quantity, default: 0
      t.float :price_override

      t.timestamps
    end
  end
end
