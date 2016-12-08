class CommitsController < ApplicationController

  def index
    @commits = GithubCommit.for_user(current_user.token, current_user.username)
  end

end
