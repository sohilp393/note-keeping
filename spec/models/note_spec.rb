require 'rails_helper'
require 'faker'

RSpec.describe Note, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:roles) }

    it do
      is_expected.to have_many(:users).through(:roles).dependent(:delete_all)
    end
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of :title }

    it { is_expected.to validate_length_of(:title).is_at_least(3) }

    it { is_expected.to validate_length_of(:title).is_at_most(50) }
  end
end
