require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  it { is_expected.to validate_presence_of(:owner) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to validate_presence_of(:cvv) }
  it { is_expected.to validate_presence_of(:expiration) }
end
