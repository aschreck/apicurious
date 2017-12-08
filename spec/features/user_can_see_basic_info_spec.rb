require "rails_helper"

describe "user authorizes their github account" do
	it "they can see their username and avatar" do 
		VCR.use_cassette("user_log_in_info") do 

		mock_auth_hash
		visit "/"
		click_on "Login"
	end 
	
		expect(current_path).to eq '/dashboard'
		expect(page).to have_css(".name")
		expect(page).to have_css(".follower")
		expect(page).to have_css(".following")
		expect(page).to have_css(".repos")
		expect(page).to have_css(".starred-repos")
		expect(page).to have_css(".commits")
	end 
end 
