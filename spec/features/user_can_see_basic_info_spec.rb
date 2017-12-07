require "rails_helper"

	

describe "user authorizes their github account" do
	it "they can see their username and avatar" do 
		VCR.use_cassette("user_log_in_info") do 

		mock_auth_hash
		visit "/"
		click_on "Login"
	
		expect(current_path).to eq '/dashboard'
		expect(page).to have_css(".name")
		end 
	end 
end 
