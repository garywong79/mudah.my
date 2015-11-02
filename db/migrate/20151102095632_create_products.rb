class CreateProducts < ActiveRecord::Migration
	def change
		create_table :products do |t|
			t.string :product_detail, null: false
			t.string :product_price, null: false
			t.integer :user_id
			t.timestamps
		end
	end
end
