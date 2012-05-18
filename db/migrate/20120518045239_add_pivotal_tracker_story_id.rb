class AddPivotalTrackerStoryId < ActiveRecord::Migration
  def up
    add_column :items, :pivotal_tracker_story_id, :string
  end

  def down
    remove_column :items, :pivotal_tracker_story_id
  end
end
