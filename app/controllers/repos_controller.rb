class ReposController < ApplicationController
  def index
    @repos = GithubRepo.for_user(current_user.token) if current_user
  end
end
