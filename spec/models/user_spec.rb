require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:roles) }

    it { is_expected.to have_many(:notes).through(:roles) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }

    it { is_expected.to validate_length_of(:name).is_at_least(3) }

    it { is_expected.to validate_length_of(:name).is_at_most(20) }

    it { is_expected.to validate_presence_of :email }

    it { is_expected.to validate_length_of(:email).is_at_least(10) }

    it { is_expected.to validate_length_of(:email).is_at_most(50) }
  end

  describe '#first_name' do
    it 'returns the first_name of the user' do
      wick = FactoryBot.create(:user, name: 'John Wick')
      expect(wick.first_name).to eq('John')
    end
  end

  describe '#last_name' do
    it 'returns the last_name of the user' do
      wick = FactoryBot.create(:user, name: 'John Wick')
      expect(wick.last_name).to eq('Wick')
    end
  end
end
