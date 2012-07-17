namespace :db do
	desc "Put sample data in database"
	task populate: :environment do
		15.times do |n|
			the_title = "Title #{n} - #{Faker::Lorem.sentence}"
			the_content = "Content #{n} - #{Faker::Lorem.paragraph}"
			p = Post.create!(title: the_title, content: the_content)
			2.times do |n|
				p.comments.create!(body: "Body #{n}, #{Faker::Lorem.paragraph}")
			end
		end
	end
end