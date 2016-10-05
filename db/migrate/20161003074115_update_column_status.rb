class UpdateColumnStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :status, :boolean, :default => false
  end
end
