class AddColumnToPassedTests < ActiveRecord::Migration[6.1]
  change_table :passed_tests do |t|
    t.integer :correct_questions, default: 0
  end
end
