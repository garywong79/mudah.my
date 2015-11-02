enable :sessions
#####


#C-Create - return an HTML form for creating a new action/object
get "/products/:user_id/new" do

@user = User.find(params[:user_id])

erb :"static/products"
end

#C-Create - create the new action/object
post "/products/:user_id" do

	@user = User.find(params[:user_id])
	@product = @user.products.create(product_detail: params[:product][:product_detail], product_price: params[:product][:product_price], user_id: current_user.id)

	erb :"static/index"
end
#R-Index - display all the info
get "/products" do
	@user = User.find(session[:user_id])
	@product = Property.all
	erb :"static/index"
end

#R-display the only and only geocoder resources
get "/geocoder/:id" do #:id is a placeholder name, 
	#params[this must be is the same name as above]
end

#U-edit return an HTML form for editing the geocoder
get "/products/:product_id/edit" do
	@product = Property.find(params[:product_id])
	if @product.user == current_user
		erb :"static/product_edit"
	else
		redirect to "/"
	end
end

#U-update - update the one andonly geocoder resource
put "/products/:product_id" do

	@product = Property.find(params[:product_id])
	@product[:product_detail] = params[:product][:product_detail]
	@product[:product_price] = params[:product][:product_price]
	@product.save
	redirect to "/products"
end

#U-delete the geocoder resource
delete "/products/:product_id" do
	@product = Property.find(params[:product_id])
	@product.destroy
	redirect to "/products"
end