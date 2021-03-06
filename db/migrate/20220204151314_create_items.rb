class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :unit
      t.integer :price

      t.timestamps
    end
    add_index :items, :name,                 unique: true
  end
end
