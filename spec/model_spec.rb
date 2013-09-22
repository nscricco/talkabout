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

	User.destroy_all
end

describe 'Topic' do
	include Spec

	it 'should be invalid without a title' do
		
	end
end