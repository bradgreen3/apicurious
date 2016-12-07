class GithubUser

  def self.all_repos(current_user)
    service = GithubService.new(current_user)
    service.repos.map do |repo|
      GithubUser.new(repo(current_user))
    end
  end

end
