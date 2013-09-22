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

	User.destroy_all
	Topic.destroy_all
	Comment.destroy_all
end