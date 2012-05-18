class Item < ActiveRecord::Base
  HAPPY = 'happy'
  MEH = 'meh'
  SAD = 'sad'
  ACTION = 'action'

  attr_accessible :category, :description

  def self.build_happy
    new.tap do |item|
      item.category = HAPPY
    end
  end

  def self.build_meh
    new.tap do |item|
      item.category = MEH
    end
  end

  def self.build_sad
    new.tap do |item|
      item.category = SAD
    end
  end

  def self.build_action
    new.tap do |item|
      item.category = ACTION
    end
  end

  def send_to_tracker(api_token, project_id)
    PivotalTracker::Client.token = api_token
    project = PivotalTracker::Project.find(project_id)

    story ||= project.stories.create(name: description, story_type: 'chore')
    story = if story
    else
      self.pivotal_tracker_story_id = story.id
      self.save!
    end
  end
end
