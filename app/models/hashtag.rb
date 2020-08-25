class Hashtag < ApplicationRecord
	validates :hashname, presence: true, length: {maximum:20}
	has_many :diary_hashtags, dependent: :destroy
	has_many :diaries, through: :diary_hashtags

	def Hashtag.search(search, diary_or_hashtag, how_search)
		if diary_or_hashtag == "2"
			if how_search == "1"
				Hashtag.where(['hashname LIKE ?', "%#{search}%"])
			elsif how_search == "2"
				Hashtag.where(['hashname LIKE ?', "#{search}"])
			end
		end
	end

end
