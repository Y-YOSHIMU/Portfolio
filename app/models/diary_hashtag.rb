class DiaryHashtag < ApplicationRecord
  belongs_to :diary
  belongs_to :hashtag
  validates :diary_id, presence: true
  validates :hashtag_id, presence: true
end
