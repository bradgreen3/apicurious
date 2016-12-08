class GithubEvent
attr_reader :type, :login, :name

  def initialize(attributes = {})
    @name = attributes[:repo][:name]
    @type = clean_type(attributes[:type])
    @login = attributes[:actor][:login]
  end

  def self.for_user(token, username)
    GithubService.new(token).events(username).map do |raw_event|
      GithubEvent.new(raw_event)
    end
  end

  def clean_type(raw_type)
    converter = {
      "CreateEvent"         => "created",
      "ForkEvent"           => "forked",
      "PullRequestEvent"    => "opened pull request on",
      "PushEvent"           => "pushed to",
      "IssueCommentEvent"   => "commented on",
      "DeleteEvent"         => "deleted a branch from"
    }

    converter[raw_type]
  end

end
