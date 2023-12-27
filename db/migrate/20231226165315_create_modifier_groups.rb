class CreateModifierGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :modifier_groups, id: false, force: true do |t|
      t.string :identifier, primary_key: true
      t.string :label
      t.integer :selection_required_min
      t.integer :selection_required_max

      t.timestamps
    end
    add_index :modifier_groups, [:identifier], unique: true
  end
end
