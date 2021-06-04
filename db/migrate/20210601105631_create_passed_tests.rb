class CreatePassedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :passed_tests do |t|
      t.references :test, null: false, foreign_key: true, unique: true
      t.references :user, null: false, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
