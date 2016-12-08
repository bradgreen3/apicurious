require 'rails_helper'

describe "GithubService" do
  context "#repositories" do
    it "returns all repositories for a user" do
      VCR.use_cassette("#repos") do
        repos = GithubService.new(ENV["github_user_token"]).repos
        repo = repos.first

        expect(repos).to be_an(Array)
        expect(repo).to have_key(:name)
        expect(repo).to have_key(:full_name)
        expect(repo).to have_key(:description)
      end
    end
    context "#starred_repos" do
      it "returns all starred repos" do
        VCR.use_cassette("#starred_repos") do
          starred_repos = GithubService.new(ENV["github_user_token"]).starred_repos
          starred_repo = starred_repos.first

          expect(starred_repos).to be_an(Array)
          expect(starred_repo).to have_key(:full_name)
          expect(starred_repo).to have_key(:updated_at)
          expect(starred_repo).to have_key(:language)
        end
      end
    end
    context "#events" do
      it "returns all received events" do
        VCR.use_cassette("#events") do
          events = GithubService.new(ENV["github_user_token"]).events('bradgreen3')
          event = events.first

          expect(events).to be_an(Array)
          expect(event).to have_key(:type)
          expect(event[:actor]).to have_key(:login)
          expect(event[:repo]).to have_key(:name)
        end
      end
    end
    context "#organizations" do
      it "returns all organizations" do
        VCR.use_cassette("#organizations") do
          organizations = GithubService.new(ENV["github_user_token"]).organizations
          organization = organizations.first

          expect(organizations).to be_an(Array)
          expect(organization).to have_key(:login)
          expect(organization).to have_key(:description)
        end
      end
    end
    context "#commits" do
      it "returns all user events of which some include commits" do
        VCR.use_cassette("#commits") do
          commits = GithubService.new(ENV["github_user_token"]).commits('bradgreen3')
          commit = commits.first

          expect(commits).to be_an(Array)
          expect(commit).to have_key(:type)
          expect(commit[:repo]).to have_key(:name)
          expect(commit).to have_key(:created_at)
        end
      end
    end
  end
end
