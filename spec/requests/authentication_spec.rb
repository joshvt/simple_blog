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

		it "should do signup" do
			visit signup_path
			u = FactoryGirl.build(:user)
			fill_in "user_email", with: u.email
			fill_in "user_password", with: "p"
			fill_in "user_password_confirmation", with: "p"
			click_on "Submit"
#						save_and_open_page

			current_path.should == "/"
			page.should have_content("Signed up!")
		end
	end
end
