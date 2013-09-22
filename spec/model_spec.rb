require 'spec_helper'

describe 'User' do
	include Spec

	it 'should be invalid without an email and password' do
		user = User.create
		expect(user).not_to be_valid
		User.destroy_all
	end
	it 'should be valid with an email and password' do
		user = User.create(email: 'test@gmail.com', password: 'pass')
		expect(user).to be_valid
		User.destroy_all
	end
	it 'should return a user\'s name as a full string' do
		user = User.create(firstname: 'first', lastname: 'last', email: 'test@gmail.com', password: 'pass')
		expect(user.name).to include 'first last'
		User.destroy_all
	end
end

describe 'Topic' do
	include Spec
end