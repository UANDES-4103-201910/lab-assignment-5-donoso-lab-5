class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def user_params			params.require(:user).permit(:name,:lastname,:email,:password, :adress)
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		@user.update!(user_params)
		redirect_to @user
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

end
