class RemoveTimeFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :schedule_time, :time
  end
end
