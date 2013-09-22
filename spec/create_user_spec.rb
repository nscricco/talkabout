require 'spec_helper'

describe 'Create Users' do
	include FeatureSpec

	user = User.create(
		firstname: 'Nicholas',
		lastname: 'Scricco',
		email: 'nscricco@gmail.com',
		password: 'password')
	

end