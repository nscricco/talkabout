require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user'
require_relative 'models/topic'
require_relative 'models/comment'
require_relative 'talkabout'

if settings.test?
	set :database, 'sqlite3:///db/talkabout'
else
	configure :development do
		set :database, 'sqlite3:///mydb.sqlite3'
	end

	configure :production do
		ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
	end
end