require 'spec_helper'

describe 'Homepage' do
	include Spec

	let!(:user) {User.create(email: 'test@gmail.com', password: 'pass')}
	let!(:topic) {Topic.create(title: 'title', body: 'body', user: user)}

	it 'should load' do
		get '/'
		last_response.should be_ok
	end
	it 'should show list of discussions' do
		get '/'
		expect(last_response.body).to include topic.title
	end
	describe 'discussions' do
		it 'should display the author' do
			get '/'
			expect(last_response.body).to include topic.user.name
		end
	end
end

describe 'Topic Page' do
	include Spec

	let!(:user) {User.create(email: 'test@gmail.com', password: 'pass')}
	let!(:topic) {Topic.create(title: 'title', body: 'topic_body', user: user)}
	let!(:comment) {Comment.create(body: 'comment_body', topic: topic, user: user)}

	it 'should load' do
		get "topic/#{topic.title}"
		last_response.should be_ok
	end
	it 'should display the topic body' do
		get "topic/#{topic.title}"
		expect(last_response.body).to include topic.body
	end
	it 'should display the author' do
		get "topic/#{topic.title}"
		expect(last_response.body).to include topic.user.name
	end
	it 'should display all comments' do
		get "topic/#{topic.title}"
		expect(last_response.body).to include comment.body
	end
end