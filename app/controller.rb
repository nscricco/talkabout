require 'sinatra'
require_relative './config'

get '/' do
	@topics = Topic.all
	erb :home
end