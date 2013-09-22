require 'active_record'
require_relative '../config'

class Topic < ActiveRecord::Base
	belongs_to :user, class_name: 'User', foreign_key: 'user_id'
	has_many :comments

	validates_presence_of :title, :body, :user
end