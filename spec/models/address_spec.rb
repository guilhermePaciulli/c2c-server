require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to validate_presence_of(:zip_code) }
  it { is_expected.to validate_presence_of(:complement) }
  it { is_expected.to validate_presence_of(:users_id) }
end