require 'rails_helper'

RSpec.describe Christmas, type: :model do
  subject(:christmas) { create(:christmas) }

  it { is_expected.to validate_presence_of(:signup_deadline) }
end
