class ChangeCostInExpensesTableToFloatFromInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :expenses, :cost, :float
  end
end
