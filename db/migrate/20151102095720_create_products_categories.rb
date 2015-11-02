class CreateProductCategories < ActiveRecord::Migration
	def change
		create_table :productscategories do |t|
			t.integer :product_id
			t.integer :category_id
		end
	end
end
