require 'faker'
require_relative '../app/config.rb'

class Seed
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

seeder = Seed.new

users = []
60.times { users << seeder.create_user }
30.times do
	topic = seeder.create_topic(users.sample)
	5.times { seeder.create_comment(users.sample, topic) }
end