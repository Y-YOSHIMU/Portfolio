class Diary < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	attachment :image
  has_many :diary_hashtags, dependent: :destroy
  has_many :hashtags, through: :diary_hashtags

  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }


#DBへのコミット直前に実施する
  	after_create do
    	diary = Diary.find_by(id: self.id)
    	hashtags = body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    	hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      		tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      		diary.hashtags << tag
    	end
  	end

  	before_update do
    	diary = Diary.find_by(id: self.id)
    	diary.hashtags.clear
    	hashtags = body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    	hashtags.uniq.map do |hashtag|
      		tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      		diary.hashtags << tag
    	end
  	end

	enum emotion_status:{
    normal:       0, #普通
    positive:     1, #ポジティブ
    negative:     2, #ネガティブ
  }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def self.search(search, diary_or_hashtag, how_search)
		if diary_or_hashtag == "1"
			if how_search == "1"
				Diary.where(['title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"])
			elsif how_search == "2"
				Diary.where(['title LIKE ? OR body LIKE ?', "#{search}", "#{search}"])
			end
		end
	end

end
