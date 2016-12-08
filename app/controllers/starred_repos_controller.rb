class StarredReposController < ApplicationController

  def index
    @starred_repos = GithubStarredRepo.for_user(current_user.token)
  end

end
