json.array!(@diaries) do |diary|
	json.extract! diary, :id, :title, :emotion_status
	json.start diary.created_at
	json.end diary.created_at
	json.url diary_url(diary, format: :html)
	json.backgroundColor case diary.emotion_status
		                 when "positive"
		                 	"red"
		                 when "negative"
		                 	"blue"
		                 else
		                 	"yellow"
		                 end
end