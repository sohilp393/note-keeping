require 'rails_helper'
require 'faker'

RSpec.describe Role, type: :model do
  let(:john) do
    create(
      :user,
      name: 'John',
      email: 'jones@example.com',
      password:'password'
    )
  end

  let(:notes) do
    create(
      :note,
      title: 'title',
      body: 'test body',
      user_id:john.id
    )
  end
  let(:roles) do
    create(
      :role,
      note_id: notes.id,
      user_id: john.id,
      role: 'Reader'
    )
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:note) }

    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
  end
end
