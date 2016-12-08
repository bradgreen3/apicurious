class OrganizationsController < ApplicationController

  def index
    @organizations = GithubOrganization.for_user(current_user.token)
  end

end
