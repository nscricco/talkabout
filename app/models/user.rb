require 'active_record'
require_relative '../config'

class User < ActiveRecord::Base
	has_many :topics
end