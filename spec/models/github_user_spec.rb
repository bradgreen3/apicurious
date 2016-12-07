require 'rails_helper'

describe "GithubUser" do
  context ".all_repos(@current_user)" do
    xit "returns all repos" do
      github_user = GithubUser.all_repos(@current_user)
      expect(github_user).to be_instance_of(GithubUser)
    end
  end
end
