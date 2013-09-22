require 'sinatra'
require_relative './config'

get '/' do
	@topics = Topic.all
	erb :home
end

get '/topic/:title' do
	@topic = Topic.find_by_title(params[:title])
	erb :topic
end