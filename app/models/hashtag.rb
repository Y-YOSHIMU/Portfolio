class Hashtag < ApplicationRecord
	validates :hashname, presence: true, length: {maximum:20}
	has_many :diary_hashtags, dependent: :destroy
	has_many :diaries, through: :diary_hashtags
end
