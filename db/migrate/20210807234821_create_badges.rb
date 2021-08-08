class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :image
      t.string :type, null: false
      t.string :option

      t.timestamps
    end
  end
end
