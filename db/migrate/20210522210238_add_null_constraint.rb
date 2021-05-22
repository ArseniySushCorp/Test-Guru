class AddNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :title, false)

    change_column_null(:categories, :label, false)

    change_column_null(:questions, :text, false)
    change_column_null(:questions, :number, false)
  end
end
