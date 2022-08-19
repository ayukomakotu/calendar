class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name,    null: false
      t.integer :number, null: false
      t.string :password_digest, null: false
      t.string :remember_digest
      t.references :office, null: false, foreign_key: true
      t.timestamps
    end
    add_index :users, :name, unique: true
    add_index :users, :number, unique: true
  end
end
