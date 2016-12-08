require 'rails_helper'

describe "Github starred repo" do
  context ".for_user(token)" do
    it "returns all starred repos" do
      VCR.use_cassette("GithubStarredRepo.for_user") do
        starred_repos = GithubStarredRepo.for_user(ENV['github_user_token'])
        starred_repo = starred_repos.first

        expect(starred_repos).to be_an(Array)
        expect(starred_repo).to respond_to(:full_name)
        expect(starred_repo).to respond_to(:updated_at)
        expect(starred_repo).to respond_to(:language)
      end
    end
  end
end
