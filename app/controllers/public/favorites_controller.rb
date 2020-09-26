class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: [:create, :destroy]

  def create
    favorite = current_user.favorites.build(diary_id: params[:diary_id])
    favorite.save
  end

  def destroy
    favorite = Favorite.find_by(diary_id: params[:diary_id], user_id: current_user.id)
    favorite.destroy
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id).page(params[:page]).reverse_order
  end

  private
  def set_diary
    @diary = Diary.find(params[:diary_id])
  end
end
