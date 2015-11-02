enable :sessions

get '/' do

if params[:user_id]
	@user = User.find(params[:user_id])
end

if params[:product_id]
	@product = Product.find(params[:product_id])
end

if params[:favourite_id]
	@favourite = Favourite.find(params[:favourite_id])
end

erb :"static/index"
 
end