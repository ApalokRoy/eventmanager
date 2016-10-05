class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :event_id
      t.date :schedule_date
      t.time :schedule_time

      t.timestamps
    end
  end
end
