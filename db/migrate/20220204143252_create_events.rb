class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :datetime
      t.references :user, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
