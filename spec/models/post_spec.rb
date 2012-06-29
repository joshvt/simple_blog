require 'spec_helper'

describe Post do
	let (:post) { FactoryGirl.create(:post) }

	it "should respond to content" do
		post.should respond_to(:content)
		post.should respond_to(:title)	
		post.should respond_to(:comments)	
	end

	it "should have valid content" do
		post.content = 'a'*7000
		post.should be_invalid

		post.content = nil
		post.should be_invalid
	end

	it "should have valid title" do
		post.title = nil
		post.should be_invalid

		post.title = "t"*105
		post.should be_invalid
		puts "Post in model spec: #{Post.count}"
	end

end
