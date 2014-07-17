module GalleryHelper
  def konstantins_photo?(tags)
    tags.include?('konstantin')
  end

  def paint_tweet(text)
    words = text.split
    words.each_with_index do |word, i|
      if mention?(word) || hashtag?(word)
        words[i] = "<span>#{word}</span>"
        next
      end

      if link?(word)
        words[i] = "<a href='#{word}'>#{word}</a>"
      end
    end
    words.join(" ").html_safe
  end

  def mention?(word)
    word[0, 1] == '@'
  end

  def hashtag?(word)
    word[0,1] == '#'
  end

  def link?(word)
    word[0, 4] == 'http' || word[0, 4] == 'pic.'
  end
end
