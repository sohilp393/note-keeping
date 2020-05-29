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

  validates :title, presence: true, length: { mininmum: 3, maximum: 50 }
end
