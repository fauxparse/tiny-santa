require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:avatar) }
  it { is_expected.to validate_presence_of(:screen_name) }
  it { is_expected.to validate_uniqueness_of(:screen_name).case_insensitive }
  it { is_expected.to validate_presence_of(:uid) }
  it { is_expected.to validate_uniqueness_of(:uid).case_insensitive }
end
