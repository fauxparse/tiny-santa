require 'rails_helper'

RSpec.describe Candidate, type: :model do
  let(:harry)     { build(:harry, christmas: christmas) }
  let(:ron)       { build(:ron, christmas: christmas) }
  let(:hermione)  { build(:hermione, christmas: christmas) }
  let(:draco)     { build(:draco, christmas: christmas) }
  let(:neville)   { build(:neville, christmas: christmas) }
  let(:christmas) { create(:christmas) }

  def build_candidates(santa, recipients)
    recipients.each do |recipient|
      santa.candidates.build(uid: recipient.user.uid)
    end
    santa.save!
  end

  before do
    build_candidates(harry,    [ron, hermione, draco])
    build_candidates(hermione, [harry, ron, neville])
    build_candidates(ron,      [harry, hermione, neville])
    build_candidates(draco,    [harry, hermione, neville])
    build_candidates(neville,  [harry, hermione, ron, draco])
  end

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
