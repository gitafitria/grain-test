class UpdateIndexForModifier < ActiveRecord::Migration[7.1]
  def change
    add_index :modifiers, [:item_id, :modifier_group_id, :label], unique: true
  end
end
