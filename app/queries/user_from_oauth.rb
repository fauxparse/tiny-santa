class UserFromOauth
  def initialize(auth_hash)
    @auth_hash = auth_hash
  end

  def user
    @user ||= updated(find_user || create_user)
  end

  private

  attr_reader :auth_hash

  def uid
    auth_hash[:uid]
  end

  def info
    @info ||= auth_hash[:info]
  end

  def find_user
    User.find_by(twitter_id: uid)
  end

  def create_user
    User.new(twitter_id: uid)
  end

  def updated(user)
    user.name = info[:name]
    user.username = info[:nickname]
    user.email = info[:email]
    user.avatar = info[:image]
    user.save! if user.changed?
    user
  end
end
