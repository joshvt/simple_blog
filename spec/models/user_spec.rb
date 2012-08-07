require 'spec_helper'

describe User do
	let (:user) { FactoryGirl.create(:user) }

	it "should be valid" do
		user.should respond_to(:email)
		user.email.should be_present

		user.email = nil
		user.should be_invalid

		user.email = "2@com.com"
		user.should be_valid

		user.password_hash.should be_present
		user.password_salt.should be_present

		user.auth_token.should be_present

		u = User.find_by_auth_token(user.auth_token)
		u.should == user
	end

	it "incorrect password should be be_invalid" do
		bad_user = FactoryGirl.build(:user)
		bad_user.password = "bad pwd"	
		bad_user.valid?.should be_false

		bad_user.password_confirmation = "bad pwd"
		bad_user.valid?.should be_true
	end

	it "authenticates email and password" do
		user = FactoryGirl.create(:user)
		u = user.authenticate("p")
		user.should == u

		u = user.authenticate("d")
		user.should_not == u
	end

end
