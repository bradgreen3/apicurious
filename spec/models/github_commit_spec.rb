require 'rails_helper'

describe "GithubCommit" do
  context ".for_user(token)" do
    it "returns all events for a user of which some are commits" do
      VCR.use_cassette("GithubCommit.for_user") do
        username = 'bradgreen3'
        commits = GithubCommit.for_user(ENV["github_user_token"], username)
        commit = commits.first

        expect(commits).to be_an(Array)
        expect(commit).to be_a(GithubCommit)
        expect(commit).to respond_to(:type)
        expect(commit).to respond_to(:repo_name)
        expect(commit).to respond_to(:created_at)
      end
    end
  end
end
