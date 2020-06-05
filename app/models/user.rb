# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#  id                       :integer(4)      not null, primary key
#  email                    :string(255)
#  encrypted_password       :string(255)
#  name                     :string(255)
#  reset_password_token     :string(255)
#  reset_password_sent_at   :datetime
#  remember_created_at      :datetime
#  sign_in_count            :integer(4)
#  current_sign_in_at       :datetime
#  last_sign_in_at          :datetime
#  current_sign_in_ip       :string(255)
#  last_sign_in_ip          :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#
class User < ApplicationRecord
  has_many :roles
  has_many :notes, through: :roles, dependent: :delete_all

  validates :name, presence: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, length: { in: 10..50 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :notes_roles, lambda { |user_id, role|
    User.find(user_id).roles.where(role: role)
  }

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end
end
