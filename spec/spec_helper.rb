#RACK_ENV=test rake db:migrate

$LOAD_PATH.unshift(File.expand_path('./app'))
ENV['RACK_ENV'] = 'test'

require 'config'
require 'rack/test'

set :raise_erros, true
set :dump_errors, true
set :show_exceptions, false

module Spec
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	def session
		last_request.env['rack.session']
	end

	RSpec.configure do |config|
		config.before do
			User.destroy_all
			Topic.destroy_all
			Comment.destroy_all
		end
	end
end