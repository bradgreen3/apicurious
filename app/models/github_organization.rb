class GithubOrganization

  attr_reader :name, :description

  def initialize(raw_org={})
    @name = raw_org[:login]
    @description = raw_org[:description]
  end

  def self.for_user(token)
    organizations = GithubService.new(token).organizations
    organizations.map do |raw_org|
      GithubOrganization.new(raw_org)
    end
  end
end
