require 'spec_helper'


describe "Authentication" do
	it "should have signup link" do
		visit root_path
		page.should have_link("Sign-up")
		page.should have_link("Login")
	end

	describe "signup page" do
		it "should have email and pwd field" do
			visit "/signup"
			page.should have_content("Email")
			page.should have_content("Password")			
		end
	end
end
