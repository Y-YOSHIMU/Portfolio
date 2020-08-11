class Public::FavoritesController < ApplicationController

	def create
		favorite = current_user.favorites.build(diary_id: params[:diary_id])
		favorite.save
		redirect_to request.referer
	end

	def destroy
		favorite = Favorite.find_by(diary_id: params[:diary_id], user_id: current_user.id)
		favorite.destroy
		redirect_to request.referer
	end
end
