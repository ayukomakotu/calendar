class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.string :name

      t.timestamps
    end
    add_index :routes, :name,   unique: true
  end
end
