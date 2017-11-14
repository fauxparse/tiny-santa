class Santa < ApplicationRecord
  belongs_to :christmas
  belongs_to :user
  belongs_to :recipient, class_name: 'Santa', optional: true
  has_many :candidates, dependent: :destroy, autosave: true

  validates :christmas_id, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :christmas_id }
  validates :recipient_id, uniqueness: { scope: :christmas_id }, allow_nil: true
  validates :conditions, acceptance: true, if: :new_record?
  validate :at_least_three_candidates

  delegate :name, :uid, to: :user

  private

  def at_least_three_candidates
    errors.add(:mutuals, 'You need at least 3 people on your ‘nice’ list') \
      unless candidates.size >= 3
  end
end
