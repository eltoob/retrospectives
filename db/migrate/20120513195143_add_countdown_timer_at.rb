class AddCountdownTimerAt < ActiveRecord::Migration
  def up
    add_column :retros, :seconds_left, :integer
  end

  def down
    remove_column :retros, :seconds_left
  end
end
