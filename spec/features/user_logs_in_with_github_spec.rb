require "rails_helper"
require "launchy"

describe "Login" do
  context "User visits root_path" do
    it "can log in to Github" do

      stub_omniauth

      visit root_path
      click_button "Login"
      # visit github_login_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Followers: 4")
    end
  end
end
