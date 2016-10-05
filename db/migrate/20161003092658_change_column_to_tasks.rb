class ChangeColumnToTasks < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :status, :completed
  end
end
