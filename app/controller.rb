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

get '/user/:id' do
	@user = User.find_by_id(params[:id])
	erb :user
end