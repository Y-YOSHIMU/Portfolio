json.array!(@diaries) do |diary|
	json.extract! diary, :id, :title, :emotion_status
	json.start diary.created_at
	json.end diary.created_at
	json.url diary_url(diary, format: :html)
	json.backgroundColor case diary.emotion_status
		                 when "positive"
		                 	"#e01e37"
		                 when "negative"
		                 	"#0077b6"
		                 else
		                 	"#fdc500"
		                 end
end