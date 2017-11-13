class Mutuals
  include Enumerable

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def each
    return enum_for(:each) unless block_given?

    mutual_ids.in_groups_of(100) do |ids|
      twitter.users(ids).each do |user|
        yield Presenter.new(user)
      end
    end
  end

  private

  class Presenter < SimpleDelegator
    alias user __getobj__

    def avatar
      user.profile_image_uri
    end

    def to_partial_path
      '/users/user'
    end

    def uid
      id
    end

    def url
      "https://twitter.com/#{screen_name}"
    end

    def <=>(other)
      comparable_name <=> other.comparable_name
    end

    protected

    def comparable_name
      screen_name.downcase.gsub(/[^a-z0-9]/i, '')
    end
  end

  def twitter
    @twitter ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = user.token
      config.access_token_secret = user.secret
    end
  end

  def friend_ids
    @friend_ids ||= twitter.friend_ids.to_a
  end

  def follower_ids
    @follwer_ids ||= twitter.follower_ids.to_a
  end

  def mutual_ids
    @mutual_ids ||= friend_ids & follower_ids
  end
end
