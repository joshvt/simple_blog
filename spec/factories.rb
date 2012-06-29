FactoryGirl.define do
  factory :post do
    sequence (:title) {|n| "Rake Title #{n} - #{Faker::Lorem.sentence}"} 
    sequence (:content) {|n| "Rake Content #{n} - #{Faker::Lorem.paragraph}"} 
  end

  factory :comment do
  	body  Faker::Lorem.sentence
  end
end