class HomeController < ApplicationController
  def index
    @repos = GithubService.repos
  end
end
