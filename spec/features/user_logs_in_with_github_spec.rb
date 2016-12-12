require "rails_helper"
require "launchy"

describe "Login" do
  context "User visits root_path" do
    it "can log in to Github" do
      OmniAuth.config.test_mode = true

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        provider: 'github',
        credentials: {token: '1234'},
        extra: {
          raw_info: {
            login: 'fakeuser',
            avatar_url: 'www.fakeurl.com',
            followers: 4,
            following: 3
          }
        }
      })

      user = User.new(uid: '1234',
                      username: 'fakeuser',
                      token: '1234',
                      avatar_url: 'www.fakeurl.com',
                      followers: 4,
                      following: 3)

      visit root_path
      click_button "Login"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Followers: 4")
    end
  end
end
