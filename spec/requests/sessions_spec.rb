require 'spec_helper'


describe "Sessions" do

  describe "log in page" do
    it "returns login page" do
      visit "/login"
      page.should have_content("Log in")
    end

    it "authenticates user" do
    	visit login_path
    	u = FactoryGirl.create(:user)
      u.password_hash.should be_present

      # test login
      fill_in "email", with: "#{u.email}"
      fill_in "password", with: "p"
      click_on "Submit"
      page.should have_content("Logged in!")
      page.should have_content("Logged in as #{u.email}")
      page.should have_link("Logout")

      # logs user out
      visit logout_path
      page.should have_content("Logged out!")
      page.should have_link("Login")
      page.should have_link("Sign-up")      

      visit login_path
      fill_in "email", with: u.email
      fill_in "password", with: "badpwd"
      click_on "Submit"
      page.should have_content("Invalid email or password")
    end


end
end