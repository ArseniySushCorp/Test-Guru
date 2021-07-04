class AddUniqIndexForEmailInUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, %i[email], unique: true
  end
end
