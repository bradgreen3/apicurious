require 'rails_helper'

describe "GithubRepo" do
  context ".for_user(token)" do
    it "returns repos for a user" do
      VCR.use_cassette("GithubRepo.for_user") do
        repos = GithubRepo.for_user(ENV["github_user_token"])
        repo = repos.first

        expect(repos).to be_an(Array)
        expect(repo).to be_a(GithubRepo)
        expect(repo).to respond_to(:name)
        expect(repo).to respond_to(:full_name)
        expect(repo).to respond_to(:description)
      end
    end
  end
end
