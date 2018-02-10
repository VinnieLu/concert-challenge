class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to concerts_path
		else
			render "new"
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to concerts_path
	end

	def login
		@user = User.new
	end

	def login_validation
		@user = User.find_by(email: params[:user][:email])
		if @user 
			if @user.password == params[:user][:password]
				session[:user_id] = @user.id
				redirect_to concerts_path
			else
				@user = User.new
				@errors = ["Please enter a valid user name or password"]
				render "login"
			end
		else
			@user = User.new
			@errors = ["Please enter a valid user name or password"]
			render "login"
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end
end