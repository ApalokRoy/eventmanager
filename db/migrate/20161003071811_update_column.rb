class UpdateColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :deadline, :datetime
    remove_column :tasks, :status
    add_column :tasks, :status, :boolean
  end
end
