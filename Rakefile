require_relative './app/config'
require 'sinatra/activerecord/rake'

desc 'drop the database'
task 'db:drop' do
	rm_f './mydb.sqlite3'
end

desc 'seed the database'
task 'db:seed' do
	ruby File.dirname(__FILE__) + '/db/seed.rb'
end