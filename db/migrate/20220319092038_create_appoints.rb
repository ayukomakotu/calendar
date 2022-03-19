class CreateAppoints < ActiveRecord::Migration[6.1]
  def change
    create_table :appoints do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.date :day
      t.time :time
      t.string :kind
      t.string :result

      t.timestamps
    end
  end
end
