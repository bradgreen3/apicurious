class HomeController < ApplicationController

  def index
    @events = GithubEvent.for_user(current_user.token, current_user.username) if current_user
  end

end
