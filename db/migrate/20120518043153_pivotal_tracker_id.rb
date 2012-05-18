class PivotalTrackerId < ActiveRecord::Migration
  def up
    add_column :users, :pivotal_tracker_project_id, :string
    add_column :users, :pivotal_tracker_api_key, :string
  end

  def down
    remove_column :users, :pivotal_tracker_project_id
    remove_column :users, :pivotal_tracker_api_key
  end
end
