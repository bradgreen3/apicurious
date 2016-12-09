require "rails_helper"

describe "Login" do
  context "User visits root_path" do
    xit "can log in to Github" do
      visit root_path
      click_button 'Login'
      expect(page).to have_content("")
    end
  end
end
