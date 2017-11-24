class Christmas < ApplicationRecord
  has_many :santas

  validates :signup_deadline, presence: true

  scope :current, -> { where('signup_deadline >= ? AND signup_deadline < ?', Time.now.beginning_of_year, Time.now.beginning_of_year + 1.year) }
  scope :oldest_first, -> { order(signup_deadline: :asc) }

  def self.present
    current.first
  end
end
