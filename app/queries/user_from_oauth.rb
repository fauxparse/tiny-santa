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
    @uid ||= auth_hash[:uid]
  end

  def info
    @info ||= auth_hash[:info]
  end

  def credentials
    @credentials ||= auth_hash[:credentials]
  end

  def find_user
    User.find_by(uid: uid)
  end

  def create_user
    User.new(uid: uid)
  end

  def updated(user)
    user.name = info[:name]
    user.screen_name = info[:nickname]
    user.email = info[:email]
    user.avatar = info[:image]
    user.token = credentials[:token]
    user.secret = credentials[:secret]
    user.save! if user.changed?
    user
  end
end
