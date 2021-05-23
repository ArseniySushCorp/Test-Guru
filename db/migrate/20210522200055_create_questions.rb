class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.integer :number, null: false
      t.belongs_to :test

      t.timestamps
    end
  end
end
