class Public::SearchController < ApplicationController
	before_action :authenticate_user!

	def search
		@diary_or_hashtag = params[:option]
		@how_search = params[:choice]
		@search = params[:search]
		if @diary_or_hashtag == "1"
			@diaries = Diary.search(params[:search], @diary_or_hashtag, @how_search).page(params[:page]).reverse_order
		else
			@hashtags = Hashtag.search(params[:search], @diary_or_hashtag, @how_search).page(params[:page]).reverse_order
		end
  	end
end
