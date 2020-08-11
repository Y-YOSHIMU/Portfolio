class Public::FavoritesController < ApplicationController

	def create
		@diary = Diary.find(params[:diary_id])
		favorite = current_user.favorites.build(diary_id: params[:diary_id])
		favorite.save
	end

	def destroy
		@diary = Diary.find(params[:diary_id])
		favorite = Favorite.find_by(diary_id: params[:diary_id], user_id: current_user.id)
		favorite.destroy
	end

	def index
		@favorites = Favorite.where(user_id: current_user.id)
	end
end
