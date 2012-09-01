class ChangeSettingsToText < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :settings, :text
    end
  end

  def down
    change_table :users do |t|
      t.change :settings, :string
    end
  end
end
