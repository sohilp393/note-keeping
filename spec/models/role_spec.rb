require 'rails_helper'
require 'faker'

RSpec.describe Role, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:note) }

    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
    # Pending
    it do
      is_expected.to validate_uniqueness_of(:user).scoped_to(:note)
    end
  end
end
