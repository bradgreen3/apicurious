class GithubRepo
attr_reader :name, :full_name, :description, :updated_at, :language

  def initialize(attributes = {})
    @name = attributes[:name]
    @full_name = attributes[:full_name]
    @description = attributes[:description]
    @updated_at = clean_date(attributes[:updated_at])
    @language = attributes[:language]
  end

  def self.for_user(token)
    GithubService.new(token).repos.map do |raw_repo|
      GithubRepo.new(raw_repo)
    end
  end

  def clean_date(raw_date)
    d = DateTime.parse(raw_date)
    d.strftime('%B %e, %Y at %H:%M')
  end

end
