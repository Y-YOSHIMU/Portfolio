module Public::DiariesHelper
  def render_with_hashtags(content)
    content.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/diary/hashtag/#{word.delete("#")}"}.html_safe
  end
end
