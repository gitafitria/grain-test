class CreateMenuSections < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_sections do |t|
      t.references :menu, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.references :section, null: false, foreign_key: { primary_key: :identifier }, type: :string
      t.integer :display_order, default: 0

      t.timestamps
    end
    # add_index :menu_sections, [:menu_id, :section_id], unique: true
  end
end
