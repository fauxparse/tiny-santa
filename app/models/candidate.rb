class Candidate < ApplicationRecord
  belongs_to :santa
  has_one :user, through: :santa

  validates :uid, uniqueness: { scope: :santa_id }

  def self.mutual
    includes(:santa, :user)
      .references(:santa, :user)
      .joins(
        <<-SQL
          INNER JOIN candidates c2 ON c2.uid = users.uid
          INNER JOIN santas s2 ON c2.santa_id = s2.id
          INNER JOIN users u2 ON s2.user_id = u2.id
        SQL
      )
      .where('u2.uid = candidates.uid')
  end
end
