class RemoveDateFromTask < ActiveRecord::Migration
  def up
    remove_column :tasks, :date
  end

  def down
    add_column :tasks, :date, :date
  end
end
