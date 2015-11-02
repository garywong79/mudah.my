class CreateCategories < ActiveRecord::Migration
	def change
		create_table :categories do |t|
			t.string :categories_name, null: false
			t.integer :product_id
			t.integer :user_id
			t.timestamps
		end
	end
end
