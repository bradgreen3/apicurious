require 'rails_helper'

describe "GithubEvent" do
  context ".for_user(token)" do
    it "returns events for a user" do
      VCR.use_cassette("GithubEvent.for_user") do
        username = 'bradgreen3'
        events = GithubEvent.for_user(ENV["github_user_token"], username)
        event = events.first

        expect(events).to be_an(Array)
        expect(event).to be_a(GithubEvent)
        expect(event).to respond_to(:type)
        expect(event).to respond_to(:login)
        expect(event).to respond_to(:name)
      end
    end
  end
end
