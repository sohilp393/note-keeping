require 'rails_helper'

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
      user = User.new(
        name: 'kiprosh test',
        email: 'kiprosh@gmail.com',
        password: 'abc12345')
      user.save!
      expect(user.first_name).to eq('kiprosh')
    end
  end

  describe '#last_name' do
    it 'returns the last_name of the user' do
      user = User.new(
        name: 'kiprosh test',
        email: 'kiprosh@gmail.com',
        password: 'abc12345')
      user.save!
      expect(user.last_name).to eq('test')
    end
  end
end
