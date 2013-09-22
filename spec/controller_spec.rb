require 'spec_helper'

describe 'Homepage' do
	include Spec

	let!(:user) {User.create(email: 'test@gmail.com', password: 'pass')}
	let!(:topic) {Topic.create(title: 'title', body: 'body', user: user)}

	it 'should show list of discussions' do
		get '/'
		expect(last_response.body).to include topic.body
	end
end