require "rails_helper"

describe "user authorizes their github account" do
	it "they can see their username and avatar" do 
		VCR.use_cassette("user_can_see_basic_info")	
		stub_omniauth
		visit "/"
		click_on "login"
	
		expect(current_path).to eq '/dashboard'
	end 
end 
