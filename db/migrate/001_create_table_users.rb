class CreateTableUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :firstname, :lastname, :email, :password
			t.timestamps
		end
	end
end