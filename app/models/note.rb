# frozen_string_literal: true
# == Schema Information
#
# Table name: notes
#  id                :integer(4)      not null, primary key
#  title             :string(255)
#  body              :text
#  user_id           :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
class Note < ApplicationRecord
  belongs_to :user
  has_many :roles
  has_many :users, through: :roles, dependent: :delete_all

  validates :title, presence: true, length: { in: 3..50 }

  scope :users_roles, -> (note_id) { Note.find(note_id).roles }
end
