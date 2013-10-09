class TrackerClient
  def initialize(api_token, project_id, text)
    PivotalTracker::Client.token = api_token
    PivotalTracker::Client.use_ssl = true

    @text = text
    @project = PivotalTracker::Project.find(project_id.to_i)
  end

  def create_chore
    return if @text.blank?

    story = @project.stories.create(
      name: @text,
      story_type: 'chore',
      labels: ['retro']
    )

    story.notes.create(:text => "Created by TeamRetro")

    story
  end
end
