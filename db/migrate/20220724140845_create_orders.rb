class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :number
      t.integer :price
      t.date :day
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
