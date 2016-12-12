require "rails_helper"
require "launchy"

describe "Login" do
  context "User visits root_path" do
    it "can log in to Github" do
      VCR.turned_off do
        WebMock.allow_net_connect!

        stub_omniauth

        visit root_path
        within ".jumbotron" do
          click_on "Login"
        end
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Followers: 2")
      end
    end
  end
end
