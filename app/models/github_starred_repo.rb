class GithubStarredRepo
  attr_reader :full_name, :updated_at, :language

  def initialize(raw_repo={})
    @full_name = raw_repo[:full_name]
    @updated_at = clean_date(raw_repo[:updated_at])
    @language = raw_repo[:language]
  end

  def self.for_user(token)
    starred_repos = GithubService.new(token).starred_repos
    starred_repos.map do |raw_repo|
      GithubStarredRepo.new(raw_repo)
    end
  end

  def clean_date(raw_date)
    d = DateTime.parse(raw_date)
    d.strftime('%B %e, %Y at %H:%M')
  end
end
