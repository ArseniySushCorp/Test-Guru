class AddUniqForTestsTitleAndLevel < ActiveRecord::Migration[6.1]
  change_table :test do |t|
    add_index :tests, %i[title level], unique: true
  end
end
