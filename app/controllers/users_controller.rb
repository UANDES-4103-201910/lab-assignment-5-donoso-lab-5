class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def user_params			params.require(:user).permit(:name,:lastname,:email,:password, :adress)
	end

	def create
		@user = User.new(user_params)
		respond to do |format|		
			if @user.save
				format.html {redirect_to @user}
				format.json {render json: @user}
			else
				format.html {render 'new'}
				format.json {render json: @user.errors, status: :not_found}
			end
	end

	def update
		@user = User.find(params[:id])
		respond to do |format|	
			@user.update!(user_params)
			format.html {redirect_to @user}
			format.json {render status: :no_content}
	end

	def destroy
		@user = User.find(params[:id])
		respond to do |format|	
			@user.destroy
			format.html {redirect_to @user}
			format.json {render status: :reset_content}
	end

	def index 
		@user = User.all
	end
	
	def show
		@user = User.find(params[:id])
	end

end
