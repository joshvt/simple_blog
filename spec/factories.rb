FactoryGirl.define do
  factory :comment do
  	sequence (:body) {|n|  "Comment body #{n} - #{Faker::Lorem.paragraph} "}
  	post
  end

  factory :post do
    sequence (:title) {|n| "Title #{n} - #{Faker::Lorem.sentence}"} 
    sequence (:content) {|n| "Content #{n} - #{Faker::Lorem.paragraph}"} 

    factory :post_with_comments do
    	after_create  do |post, evaluator|
    		FactoryGirl.create_list(:comment, 2, post: post)
    	end
    
    end
  end
end