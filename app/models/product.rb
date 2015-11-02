class Product < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :favourites, :dependent => :destroy
		# has_many :categories, through: :prodduct_categories :dependent => :destroy
	belongs_to :user
	
end
