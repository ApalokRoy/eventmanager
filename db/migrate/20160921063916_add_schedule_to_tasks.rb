class AddScheduleToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :schedule, :datetime
  end
end
