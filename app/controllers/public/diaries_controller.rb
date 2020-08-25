class Public::DiariesController < ApplicationController
	before_action :authenticate_user!

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
		@diaries = Diary.where(user_id: current_user.id)
		@alldiary = Diary.page(params[:page]).reverse_order
	end

	def hashtag
		@user = current_user
		@hashtag = Hashtag.find_by(hashname: params[:name])
		@diary = @hashtag.diaries.page(params[:page]).reverse_order
	end

	def edit
		@diary = Diary.find(params[:id])
	end

	def update
		@diary = Diary.find(params[:id])
		if @diary.update(diary_params)
			redirect_to diary_path(@diary)
		else
			render :edit
		end
	end

	def destroy
		@diary = Diary.find(params[:id])
		@diary.destroy
		redirect_to mypage_path(current_user)
	end

	private
	def diary_params
		params.require(:diary).permit(:user_id, :title, :body, :image, :emotion_status, hashtag_ids: [])
	end
end
