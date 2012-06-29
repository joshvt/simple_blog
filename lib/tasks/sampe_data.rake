namespace :db do
	desc "Put sample data in database"
	task populate: :environment do
		15.times do |n|
			the_title = "Title #{n} - #{Faker::Lorem.sentence}"
			the_content = "Content #{n} - #{Faker::Lorem.paragraph}"
			Post.create!(title: the_title, content: the_content)
		end
	end
end