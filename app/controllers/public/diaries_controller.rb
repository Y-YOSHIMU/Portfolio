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
	end

	private
	def diary_params
		params.require(:diary).permit(:user_id, :title, :body, :image)
	end
end
