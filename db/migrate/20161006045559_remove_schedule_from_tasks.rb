class RemoveScheduleFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :schedule, :date
  end
end
