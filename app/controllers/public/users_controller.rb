class Public::UsersController < ApplicationController
  	before_action :authenticate_user!
	before_action :set_current_user

	def show
	end

	private

	def set_current_user
    	@user = current_user
  	end

	def user_params
		params.require(:user).permit(:nickname)
	end
end
