class Public::DiariesController < ApplicationController

	def new
		@diary = Diary.new
	end

	def create
		@diary = Diary.new(diary_params)
		@diary.user_id = current_user.id
		if @diary.save
			flash[:notice] = "作成成功"
			redirect_to diary_path(@diary.id)
		else
			render :new
		end
	end

	def show
		@diary = Diary.find(params[:id])
		# @hashtag = DiaryHashtag.where(diary_id: @diary.id)
		# @hashtags = Hashtag.find(id: @hashtag)
	end

	def index
		@diaries = Diary.all
	end

	def hashtag
		@user = current_user
		if params[:name].nil?
			@hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.diaries.count}
		else
			@hashtag = Hashtag.find_by(hashname: params[:name])
			@diary = @hashtag.diaries.page(params[:page]).per(20).reverse_order
			@hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.diaries.count}
		end
	end

	private
	def diary_params
		params.require(:diary).permit(:user_id, :title, :body, :image, :emotion_status, hashtag_ids: [])
	end
end
