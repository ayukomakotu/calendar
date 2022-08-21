class CreateTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :targets do |t|
      t.references :user, foreign_key: true
      t.references :office, foreign_key: true
      t.integer :year
      t.integer :all
      t.integer :tr_3
      t.integer :tr_4
      t.integer :tr_5
      t.integer :tr_6
      t.integer :tr_7
      t.integer :tr_8
      t.integer :tr_9
      t.integer :tr_10
      t.integer :tr_11
      t.integer :tr_12
      t.integer :tr_1
      t.integer :tr_2

      t.timestamps
    end
  end
end
