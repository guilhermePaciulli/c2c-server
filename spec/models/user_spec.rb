require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:surname) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:cpf) }
  it { is_expected.to validate_length_of(:password) }
  it { is_expected.to validate_presence_of(:profile_picture) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_uniqueness_of(:cpf) }

end
