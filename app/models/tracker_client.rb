class TrackerClient
  def initialize(api_token, project_id, text)
    @api_token = api_token.to_s
    @project_id = project_id.to_i
    @text = text
  end

  def create_chore
    PivotalTracker::Client.token = @api_token
    project = PivotalTracker::Project.find(@project_id.to_i)

    story = project.stories.create(
      name: @text,
      story_type: 'chore',
      labels: ['retro']
    )

    story.notes.create(:text => "Created by teamretrospective.com")

    story
  end
end
