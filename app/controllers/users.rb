enable :sessions


#C-Create - return an HTML form for creating a new action/object
get "/users/new" do

	if params[:signup_msg]
		@signup_msg = params[:signup_msg]
	end

	if params[:error]
		@error = params[:error]
	end

	erb :"static/signup"
end

#C-Create - create the new action/object
post "/users" do

	#setting 3 tables relationship
	# setting the user_id
	@user = User.new(name: params[:user][:name], email: params[:user][:email], password:params[:user][:password])

	if @user.save
		@signup_msg = "You may login now!"
		redirect to "/users/new?signup_msg= #{@signup_msg}"
	else
		# redirect to "/users/new?#{@user}"
		erb :"static/signup"
	end
	
end
#R-Index - display all the info
get "/users" do
		@user = User.authenticate(params[:user][:email], params[:user][:password])

	if @user.nil?
		@error = "Invalid login"
		redirect to "/users/new?error= #{@error}"
	else

		session[:user_id] = @user.id
		erb :"static/index"
	end
end

#R-display the only and only geocoder resources
get "/geocoder/:id" do #:id is a placeholder name, 
	#params[this must be is the same name as above]
end


#U-delete the geocoder resource
delete "/users/:user_id" do
	session[:user_id] = nil
	redirect "/"
end

