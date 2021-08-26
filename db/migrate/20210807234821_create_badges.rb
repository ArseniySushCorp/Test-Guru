class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :image, default: 'default_badge.png'
      t.string :badge_type, null: false
      t.string :option

      t.timestamps
    end
  end
end
