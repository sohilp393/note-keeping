# frozen_string_literal: true
# == Schema Information
#
# Table name: users
class User < ApplicationRecord
  has_many :roles
  has_many :notes, through: :roles, dependent: :delete_all

  validates :name, presence: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, length: { in: 10..50 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end

  def self.contributor_role_notes(user_id)
    User.find(user_id).roles.where(role: 'Reader')
  end

  def self.reader_role_notes(user_id)
    User.find(user_id).roles.where(role: 'Reader')
  end
end
