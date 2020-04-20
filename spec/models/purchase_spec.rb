require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:product) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:credit_card) }
end
