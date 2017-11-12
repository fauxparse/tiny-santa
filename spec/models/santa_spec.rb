require 'rails_helper'

RSpec.describe Santa, type: :model do
  subject(:santa) { create(:santa) }

  it { is_expected.to validate_presence_of(:christmas_id) }
  it { is_expected.to validate_presence_of(:user_id) }
  it {
    is_expected.to validate_uniqueness_of(:user_id)
      .scoped_to(:christmas_id)
  }
end
