class GithubCommit
  attr_reader :type, :created_at, :repo_name

  def initialize(raw_event={})
    @type = clean_type(raw_event[:type])
    @created_at = clean_date(raw_event[:created_at])
    @repo_name = raw_event[:repo][:name]
  end

  def self.for_user(token, username)
    events = GithubService.new(token).commits(username).find_all { |e| e[:type] == "PushEvent" }
    events.map do |raw_event|
      GithubCommit.new(raw_event)
    end
  end

  def clean_type(raw_type)
    converter = {"PushEvent" => "Committed to"}
    converter[raw_type]
  end

  def clean_date(raw_date)
    d = DateTime.parse(raw_date)
    d.strftime('%B %e, %Y at %H:%M')
  end

end
