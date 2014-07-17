class Tweet
  attr_reader :id, :avatar, :fullname, :username, :text, :type

  def initialize(attrs = {})
    @id = attrs.fetch(:id, '')
    @avatar = attrs.fetch(:avatar, '#')
    @fullname = attrs.fetch(:fullname, 'unknown')
    @username = attrs.fetch(:username, 'unknown')
    @text = attrs.fetch(:text, '')
    @type = 'tweet'
  end
end

class TwitterAdapter
  def initialize
    tweets_file = File.open(File.join(Rails.root, "lib", "tweets.json"), "r")
    tweets_array = JSON.parse(tweets_file.read)
    @tweets_hashes = tweets_array.each_with_object([]) do |tweet, array|
      array << JSON.parse(tweet)
    end
  end

  def paginated_tweets(page = 1, per_page = 10)
    @tweets_hashes.paginate(page: page, per_page: per_page)
  end

  def get_tweets(page = 1, per_page = 10)
    tweets = paginated_tweets(page, per_page)

    tweets.each_with_object([]) do |tweet, tweets|
      tweets << Tweet.new(
        id: tweet['id'],
        avatar: tweet['avatar'],
        fullname: tweet['fullname'],
        username: tweet['username'],
        text: tweet['text']
      )
    end
  end
end
