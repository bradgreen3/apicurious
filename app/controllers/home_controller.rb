class HomeController < ApplicationController
  def index
    @repos = GithubUser.all_repos(@current_user)
  end
end
