enable :sessions
#####



get "products/:product_id/favourites/new" do

@product = Product.find(params[:product_id])

erb :"static/index"

end

#C-Create - create the new action/object
post "/products/:product_id/favourites" do

	@product = Product.find(params[:product_id])

	# @favourite =@product.favourites.find_by(user_id:current_user.id)

	if Favourite.find_by(product_id: params[:product_id],user_id: current_user.id) == nil

	 @product.favourites.create(fav_product_detail: @product.product_detail ,product_id: params[:product_id], user_id: current_user.id )
		erb :"static/my_favourites"
	else
		
		@added_msg = "Already added into favourite !"
		erb :"static/index"
		# erb :"static/test"
		# redirect to "/?added_msg=#{@added_msg}"
	end
end
#R-Index - display all the info
# get "/products" do
# 	@user = User.find(session[:user_id])
# 	@product = Product.all
# 	erb :"static/index"
# end

# #R-display the only and only geocoder resources
# get "/geocoder/:id" do #:id is a placeholder name, 
# 	#params[this must be is the same name as above]
# end

# #U-edit return an HTML form for editing the geocoder
# get "/products/:product_id/edit" do
# 	@product = Product.find(params[:product_id])
# 	if @product.user == current_user
# 		erb :"static/product_edit"
# 	else
# 		redirect to "/"
# 	end
# end

# #U-update - update the one andonly geocoder resource
# put "/products/:product_id" do

# 	@product = Product.find(params[:product_id])
# 	@product[:product_detail] = params[:product][:product_detail]
# 	@product[:product_price] = params[:product][:product_price]
# 	@product.save
# 	redirect to "/products"
# end

# #U-delete the geocoder resource
# delete "/products/:product_id" do
# 	@product = Product.find(params[:product_id])
# 	@product.destroy
# 	redirect to "/products"
# end