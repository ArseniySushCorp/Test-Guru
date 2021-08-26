class CreateUsersBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :users_badges do |t|
      t.belongs_to :user, foreigh_key: true
      t.belongs_to :badge, foreigh_key: true

      t.timestamps
    end
  end
end
