require 'spec_helper'

describe "Posts" do
  describe "index/home" do
    it "returns blog page" do
      visit posts_path
      page.should have_content("Super Blog")

      visit "/"
      page.should have_content("Super Blog")
    end
  end
end
