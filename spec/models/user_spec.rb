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
end
