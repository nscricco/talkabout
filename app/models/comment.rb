require 'active_record'
require_relative '../config'

class Comment < ActiveRecord::Base
	belongs_to :topic, class_name: 'Topic', foreign_key: 'topic_id'
	belongs_to :comment, class_name: 'Comment', foreign_key: 'comment_id'
	belongs_to :user, class_name: 'User', foreign_key: 'user_id'
	has_many :comments

	validates_presence_of :body, :topic, :user
end