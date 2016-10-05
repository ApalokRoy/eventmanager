class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :task_id
      t.integer :cost

      t.timestamps
    end
  end
end
