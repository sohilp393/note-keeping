# == Schema Information
#
# Table name: users
class User < ApplicationRecord
  has_many :roles
  has_many :notes, through: :roles, dependent: :delete_all

  validates :name, presence: true, length: { mininmum: 3, maximum: 50 }
  validates :email, presence: true, length: { mininmum: 10, maximum: 50 }
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
end
