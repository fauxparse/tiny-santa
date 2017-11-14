require 'rails_helper'

RSpec.describe AssignSantas do
  include_context 'Hogwarts'

  subject(:service) { AssignSantas.new(christmas) }

  describe '#call' do
    subject(:solution) { service.tap(&:call).solution }
    let(:everyone) { christmas.santas.index_by(&:uid) }
    let(:uids) { everyone.keys.sort }

    it 'assigns everyone' do
      expect(solution).to have_exactly(everyone.count).items
    end

    it 'doesn’t duplicate santas' do
      expect(solution.keys.sort.uniq).to eq uids
    end

    it 'doesn’t duplicate recipients' do
      expect(solution.values.sort.uniq).to eq uids
    end
  end
end
