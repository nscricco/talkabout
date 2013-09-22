require 'spec_helper'

describe 'Homepage' do
	include Spec

	before :each do
		get '/'
	end

	it 'should load' do
		last_response.should be_ok
	end
end

describe 'Topic Page' do
	include Spec

	before :each do
		get "topic/#{topic.title}"
	end

	it 'should load' do
		last_response.should be_ok
	end
end

describe 'User Page' do
	include Spec

	before :each do
		get "user/#{user.id}"
	end

	it 'should load' do
		last_response.should be_ok
	end
end
