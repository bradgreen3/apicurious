require 'rails_helper'

describe "GithubOrganization" do
  context ".for_user(token)" do
    it "returns all organizations for user" do
      VCR.use_cassette("GithubOrganization.organizations") do

      organizations = GithubOrganization.for_user(ENV["github_user_token"])
      organization = organizations.first

      expect(organizations).to be_an(Array)
      expect(organization).to be_a(GithubOrganization)
      expect(organization).to respond_to(:name)
      expect(organization).to respond_to(:description)
      end
    end
  end
end
