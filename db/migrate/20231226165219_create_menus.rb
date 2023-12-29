class CreateMenus < ActiveRecord::Migration[7.1]
  def change
    create_table :menus, id: false, force: true do |t|
      t.string :identifier, primary_key: true
      t.string :label
      t.string :state, null: false
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :menus, [:identifier], unique: true
  end
end
