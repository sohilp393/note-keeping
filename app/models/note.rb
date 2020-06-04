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
  # belongs_to :user
  # has_many :roles
  # has_many :users, through: :roles, dependent: :delete_all
  has_and_belongs_to_many :users

  validates :title, presence: true, length: { in: 3..50 }

  def self.contributor_roles(user_id)
    sql = "
      select * from notes_users
      where user_id=#{user_id} and role = 'Contributor'"
    ActiveRecord::Base.connection.execute(sql)
  end

  def self.reader_roles(user_id)
    sql = "
      select * from notes_users
      where user_id=#{user_id} and role = 'Reader'"
    ActiveRecord::Base.connection.execute(sql)
  end
end
