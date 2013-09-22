require 'active_record'
require_relative '../config'

class Comment < ActiveRecord::Base
	belongs_to :topic, class_name: 'Topic', foreign_key: 'topic_id'
	belongs_to :comment, class_name: 'Comment', foreign_key: 'comment_id'
	has_many :comments
end