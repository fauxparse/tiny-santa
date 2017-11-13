class SignupForm
  attr_reader :user, :christmas, :santa

  def initialize(user:, christmas:)
    @user = user
    @christmas = christmas
    @santa = user.santas.new(christmas: christmas)
  end

  def model_name
    'signup'
  end

  def to_model
    santa
  end

  def mutuals
    @mutuals ||= Mutuals.new(user).to_a.sort
  end

  def candidate_uids
    if santa.candidates.any?
      santa.candidates.reject(&:marked_for_destruction?).map(&:uid)
    else
      mutuals.map(&:uid)
    end
  end

  def candidate_uids=(uids)
    santa.candidates.each do |candidate|
      candidate.mark_for_destruction unless uids.include?(candidate.uid)
    end

    (uids - santa.candidates.map(&:uid)).each do |uid|
      santa.candidates.build(uid: uid)
    end
  end

  def attributes=(attrs)
    attrs.each { |key, value| send :"#{key}=", value }
  end

  delegate :valid?, :errors, :save, :conditions, :conditions=, to: :santa
end
