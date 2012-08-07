require 'spec_helper'


describe "Password Reset" do
	let (:u) {FactoryGirl.build(:user)}

	describe "reset page" do
		let (:sent_mail) {ActionMailer::Base.deliveries}
		it "sends reset email" do
			
			visit new_password_reset_path
			fill_in "email", with: u.email
			click_on "Reset Password"
			current_path.should == "/"
			page.should have_content("Email sent with password reset instructions.")
			sent_mail = ActionMailer::Base.deliveries
		end
	end

	describe "edit page" do
    	it "lets user reset password" do
    		user = FactoryGirl.create(:user)
    		#visit edit_password_reset_url(user.password_reset_token)
    		#page.should have_content("Password Reset")
    	end
  	end
end