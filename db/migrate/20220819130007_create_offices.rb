class CreateOffices < ActiveRecord::Migration[6.1]
  def change
    create_table :offices do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :offices, :name, unique: true
  end
end
