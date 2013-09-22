require 'active_record'
require_relative '../config'

class User < ActiveRecord::Base
	has_many :topics

	validates_presence_of :email, :password

	def name
		"#{firstname} #{lastname}"
	end
end