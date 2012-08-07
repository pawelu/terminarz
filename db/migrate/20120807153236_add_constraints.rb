class AddConstraints < ActiveRecord::Migration
  def up
	change_column :tasks, :name, :string, :null => false
	change_column :tasks, :done, :boolean, :default => false
  end

  def down
  	drop_table :tasks
  end
end
