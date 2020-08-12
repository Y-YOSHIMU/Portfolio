class Public::SearchController < ApplicationController
  def search
	@diary_or_hashtag = params[:option]
	@how_search = params[:choice]
	@search = params[:search]
	if @diary_or_hashtag == "1"
		@diaries = Diary.search(params[:search], @diary_or_hashtag, @how_search)
	else
		@hashtags = Hashtag.search(params[:search], @diary_or_hashtag, @how_search)
	end
  end
end
