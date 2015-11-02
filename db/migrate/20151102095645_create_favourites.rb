class CreateFavourites < ActiveRecord::Migration
	def change
		create_table :favourites do |t|
			t.integer :fav_vote
			t.integer :user_id
			t.integer :product_id
			t.timestamps
		end
	end
end
