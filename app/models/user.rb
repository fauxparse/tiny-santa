class User < ApplicationRecord
  validates :name, :avatar, presence: true
  validates :username, :twitter_id,
    presence: true,
    uniqueness: { case_sensitive: false }

  def to_param
    username
  end
end
