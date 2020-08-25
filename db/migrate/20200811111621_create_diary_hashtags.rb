class CreateDiaryHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :diary_hashtags do |t|
      t.references :diary, foreign_key: true, index: true
      t.references :hashtag, foreign_key: true, index: true
      t.timestamps
    end
  end
end
