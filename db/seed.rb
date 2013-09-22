require 'faker'
require_relative '../app/config.rb'

class Seeder
	def create_user
		user = User.create(
			firstname: Faker::Name.first_name,
			lastname: Faker::Name.last_name,
			email: Faker::Internet.email,
			password: Faker::Internet.password)
		return user
	end

	def create_topic user
		topic = Topic.create(
			title: Faker::Company.catch_phrase,
			body: Faker::Lorem.paragraphs(paragraph_count = (rand(3)+1), supplemental = false).join('</br>'),
			user: user)
		return topic
	end

	def create_comment user, topic
		comment = Comment.create(
			body: Faker::Lorem.paragraphs(paragraph_count = (rand(2)+1), supplemental = false).join('</br>'),
			topic: topic,
			user: user)
		return comment
	end
end

mySeeder = Seeder.new

10.times do
	user = mySeeder.create_user
	3.times do
		topic = mySeeder.create_topic(user)
		5.times do
			comment = mySeeder.create_comment(user, topic)
		end
	end
end
	