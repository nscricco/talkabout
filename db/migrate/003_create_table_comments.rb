class CreateTableComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.string :body
			t.belongs_to :topic, :comment, :user
		end
	end
end