class CreateUsersBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :users_badges do |t|
      t.belongs_to :user, index: true
      t.belongs_to :badge, index: true
    end
  end
end
