class Christmas < ApplicationRecord
  has_many :santas

  validates :signup_deadline, presence: true

  scope :current, -> { where('signup_deadline > ?', Time.now) }
  scope :oldest_first, -> { order(signup_deadline: :asc) }

  def self.present
    current.oldest_first.first
  end
end
