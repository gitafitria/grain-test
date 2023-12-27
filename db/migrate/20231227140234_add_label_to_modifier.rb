class AddLabelToModifier < ActiveRecord::Migration[7.1]
  def change
    add_column :modifiers, :label, :string
  end
end
