class RemoveDateFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :schedule_date, :date
  end
end
