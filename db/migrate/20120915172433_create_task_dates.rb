class CreateTaskDates < ActiveRecord::Migration
  def change
    create_table :task_dates do |t|
      t.date :date
      t.integer :task_id

      t.timestamps
    end
  end
end
