class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items, id: false, force: true do |t|
      t.string :type
      t.string :identifier, primary_key: true
      t.string :label
      t.string :description
      t.float :price

      t.timestamps
    end
    add_index :items, [:identifier], unique: true
  end
end
