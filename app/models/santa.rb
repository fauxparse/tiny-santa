class Santa < ApplicationRecord
  belongs_to :christmas
  belongs_to :user

  validates :christmas_id, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :christmas_id }
end
