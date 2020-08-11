class AddEmotionStatusToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :emotion_status, :integer, default: 0, null: false
  end
end
