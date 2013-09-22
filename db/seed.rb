require 'faker'

module Seed
	def self.create_user
		User.create(
			firstname: Faker::Name.first_name
			lastname: Faker::Name.last_name
			email: Faker::Internet.email
			password: Faker::Internet.password)
	end

	def self.create_topic user
		Topic.create(
			title: Faker::Company.catch_phrase
			body: Faker::Lorem.paragraphs(paragraph_count = (rand(3)+1), supplemental = false).join('</br>')
			user: user)
	end

	def self.create_comment user, topic
		Comment.create(
			body: Faker::Lorem.paragraphs(paragraph_count = (rand(2)+1), supplemental = false).join('</br>')
			topic: topic
			user: user)
	end
end

10.times do
	user = Seed.create_user
	3.times do
		topic = Topic.create_topic(user)
		5.times do
			comment = Comment.create(user, topic)
		end
	end
end
	