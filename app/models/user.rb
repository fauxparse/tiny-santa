class User < ApplicationRecord
  has_many :santas, dependent: :destroy

  validates :name, :avatar, presence: true
  validates :screen_name, :uid,
    presence: true,
    uniqueness: { case_sensitive: false }

  def to_param
    username
  end
end
