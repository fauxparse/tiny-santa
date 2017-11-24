class AssignSantas
  attr_reader :christmas, :solution

  class IntractableSantas < StandardError; end

  def initialize(christmas)
    @christmas = christmas
  end

  def call
    @solution = allocate_santas
    raise IntractableSantas, 'No solution available' unless solution
    check_solution(solution)
    save_solution(solution)
    solution
  end

  private

  def allocate_santas(allocated = {}, pool = initial_pool)
    return allocated if pool.empty?
    pool = pool.sort_by { |_, candidates| candidates.size }
    santa, candidates = pool.shift

    return false if candidates.empty?

    shuffle(candidates, santa: santa, allocated: allocated).each do |candidate|
      solution = allocate_santas(
        allocated.merge(santa => candidate),
        pool.map { |s, c| [s, c - [candidate]] }
      )
      return solution if solution
    end

    false
  end

  def check_solution(solution)
    raise 'Some people didn’t give anything!' unless solution.keys.sort == santas_by_uid.keys.sort
    raise 'Some people didn’t get anything!' unless solution.values.sort == santas_by_uid.keys.sort
  end

  def save_solution(solution)
    christmas.transaction do
      solution.each do |santa_uid, recipient_uid|
        santas_by_uid[santa_uid].reload.update!(
          recipient: santas_by_uid[recipient_uid]
        )
      end
    end
  end

  def santas
    @santas ||=
      christmas
      .santas
      .includes(:candidates, :user)
      .references(:candidates)
      .merge(Candidate.mutual)
  end

  def santas_by_uid
    @santas_by_uid ||= santas.index_by(&:uid)
  end

  def initial_pool
    santas.map { |santa| [santa.uid, santa.candidates.map(&:uid)] }
  end

  def shuffle(candidates, santa:, allocated:)
    candidates = candidates.shuffle
    # try to avoid reciprocal santas
    last_resort = allocated.invert[santa]
    candidates.push(candidates.delete(last_resort)) \
      if candidates.include?(last_resort)
    candidates
  end
end
