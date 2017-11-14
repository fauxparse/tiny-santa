require 'rails_helper'

RSpec.describe Candidate, type: :model do
  include_context 'Hogwarts'

  describe '.mutuals' do
    subject(:mutuals) { santa.candidates.mutual.map(&:uid) }

    describe 'Harry’s mutuals' do
      let(:santa) { harry }

      it { is_expected.to have_exactly(3).items }
    end

    describe 'Neville’s mutuals' do
      let(:santa) { neville }

      it { is_expected.to have_exactly(3).items }

      it 'includes hermione' do
        expect(mutuals).to include(hermione.user.uid)
      end

      it 'does not include harry' do
        expect(mutuals).not_to include(harry.user.uid)
      end
    end
  end
end
