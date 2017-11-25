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

  FIELDS = {
    name:        %i[info name],
    screen_name: %i[info nickname],
    email:       %i[info email],
    avatar:      %i[info image],
    token:       %i[credentials token],
    secret:      %i[credentials secret]
  }.freeze

  def updated(user)
    FIELDS.each do |field, (section, source_field)|
      value = send(section)[source_field]
      user.send :"#{field}=", value if value.present?
    end
    user.save! if user.changed?
    user
  end
end
