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
	end

	it "incorrect password should be be_invalid" do
		bad_user = FactoryGirl.build(:user)
		bad_user.password = "bad pwd"	
		bad_user.valid?.should be_false

		bad_user.password_confirmation = "bad pwd"
		bad_user.valid?.should be_true
	end

	it "authenticates email and password" do
		u = User.authenticate(user.email,"p")
		user.should == u

		u = User.authenticate(user.email,"d")
		user.should_not == u
	end

end
