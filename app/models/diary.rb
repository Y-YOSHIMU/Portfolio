class Diary < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	attachment :image

	enum emotion_status:{
    normal:       0, #普通
    positive:     1, #ポジティブ
    negative:     2, #ネガティブ
  }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
