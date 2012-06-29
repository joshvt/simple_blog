require 'spec_helper'

describe Comment do
	it "has a body" do 
		c = FactoryGirl.create(:comment)	
		c.should respond_to(:body)
		c.should respond_to(:post)
	end
end
