require 'spec_helper'

describe 'User' do
	include Spec

	it 'should be invalid without an email' do
		user = User.create(password: 'pass')
		expect(user).not_to be_valid
	end
	it 'should be invalid without a password' do
		user = User.create(email: 'test@gmail.com')
		expect(user).not_to be_valid
	end
	it 'should be valid with an email and password' do
		user = User.create(email: 'test@gmail.com', password: 'pass')
		expect(user).to be_valid
	end
	it 'should return a user\'s name as a full string' do
		user = User.create(firstname: 'first', lastname: 'last', email: 'test@gmail.com', password: 'pass')
		expect(user.name).to include 'first last'
	end
	it 'should return anonymous when a user does not have a name' do
		user = User.create(email: 'test@gmail.com', password: 'pass')
		expect(user.name).to include 'anonymous'
	end

	User.destroy_all
end

describe 'Topic' do
	include Spec

	user = User.create(email: 'test@gmail.com', password: 'pass')

	it 'should be invalid without a title' do
		topic = Topic.create(body: 'body', user: user)
		expect(topic).not_to be_valid
	end
	it 'should be invalid without a body' do
		topic = Topic.create(title: 'title', user: user)
		expect(topic).not_to be_valid
	end
	it 'should be invalid without a user' do
		topic = Topic.create(title: 'title', body: 'body')
		expect(topic).not_to be_valid
	end
	it 'should be valid with a title, body, and user' do
		topic = Topic.create(title: 'title', body: 'body', user: user)
		expect(topic).to be_valid
	end
	it 'should be associated with one user' do
		topic = Topic.create(title: 'title', body: 'body', user: user)
		expect(topic.user.email).to include 'test@gmail.com'
	end

	User.destroy_all
	Topic.destroy_all
end

describe 'Comment' do
	include Spec

	user = User.create(email: 'test@gmail.com', password: 'pass')
	topic = Topic.create(title: 'title', body: 'body', user: user)

	it 'should be invalid without a topic' do
		comment = Comment.create(body: 'body', user: user)
		expect(comment).not_to be_valid
	end
	it 'should be invalid without a body' do
		comment = Comment.create(topic: topic, user: user)
		expect(comment).not_to be_valid
	end
	it 'should be invalid without a user' do
		comment = Comment.create(body: 'body', topic: topic)
		expect(comment).not_to be_valid
	end
	it 'should be valid with a topic, body, and user' do
		comment = Comment.create(body: 'body', topic: topic, user: user)
	end

	User.destroy_all
	Topic.destroy_all
	Comment.destroy_all
end

describe 'Sub-Comment' do
	include Spec

	user = User.create(email: 'test@gmail.com', password: 'pass')
	topic = Topic.create(title: 'title', body: 'body', user: user)
	parent_comment = Comment.create(body: 'parent comment body', topic: topic, user: user)

	it 'should refer to a parent comment' do
		comment = Comment.create(body: 'body', topic: topic, user: user, comment: parent_comment)
		expect(comment.comment.body).to include 'parent comment body'
	end

	User.destroy_all
	Topic.destroy_all
	Comment.destroy_all
end

