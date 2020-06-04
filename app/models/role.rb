# == Schema Information
#
# Table name: roles
#  id                :integer(4)      not null, primary key
#  note_id           :integer(4)
#  user_id           :integer(4)
#  role              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
# class Role < ApplicationRecord
  # belongs_to :note
  # belongs_to :user

  # validates :user, uniqueness: {scope: :note,message: 'Already assigned to the note' }
# end
