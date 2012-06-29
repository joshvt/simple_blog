require 'spec_helper'


describe "Posts" do

  describe "home page" do
    it "returns blog index page" do
      visit "/"
      page.should have_content("Super Blog")
      visit posts_path
      page.should have_content("Super Blog")
    end

    it "shows no posts" do
    	visit posts_path
    	page.should have_content("No posts")
    end


    context "when there are posts" do
	    it "displays blog content" do
  			post_one = FactoryGirl.create(:post) 
        post_two = FactoryGirl.create(:post)
        puts "PostOne #{post_one.title}"
        puts "PostTwo #{post_two.title}"

        visit posts_path
        page.should have_content(post_one.content)
        page.should have_link(post_one.title)
        page.should have_content(post_two.title)
        page.should have_content(post_two.content)
	    end
  	end
  end

  describe "edit" do 
    it "shows edit page" do
      p = FactoryGirl.create(:post)
      visit edit_post_path(p)    
      page.should have_content("Edit")
    end

    it "goes back to post on cancel" do
      p = FactoryGirl.create(:post)
      visit edit_post_path(p)  
      click_link "Cancel"
      current_path.should == post_path(p)
    end
  end

  describe "update" do 
    it "changes post with valid content" do
      p = FactoryGirl.create(:post)
      visit edit_post_path(p)   
      new_title = "New title for testing"
      fill_in "post_title", with: new_title
      click_on "Submit"
    end
  end

  describe "show" do
    it "shows the title and content" do
      p = FactoryGirl.create(:post)
      visit post_path(p)
      page.should have_link("Back")
      page.should have_content(p.title)
      page.should have_content(p.content)
      page.should have_link("Back")
      page.should have_content("Posted on")
    end
  end

  describe "New" do 
    it "has a new post form page" do
      visit new_post_path
      page.should have_content("New Post")
      page.should have_content("Title")
      page.should have_content("Content")      
      page.should have_link("Cancel")      
    end

    it "creates a new post given valid data" do
      visit new_post_path
      p = FactoryGirl.build(:post)
      fill_in "post_title", with: p.title
      fill_in "post_content", with: p.content
      click_on "Submit"
      page.should have_content(p.title)
      page.should have_content(p.content)      
    end

    it "redirects to new with invalid data" do
      visit new_post_path
      p = FactoryGirl.build(:post)
      fill_in "post_title", with: p.title
      click_on "Submit"
      page.should have_content("New Post")
      page.should have_content("can't be blank")
    end

    it "goes back to index when cancel pressed" do
      visit new_post_path
      click_on "Cancel"
      current_path.should == posts_path
    end
  end
end
