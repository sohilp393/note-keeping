# frozen_string_literal: true
class DashboardController < ApplicationController
  def index
    current_user_id = current_user.id
    @created_notes = Note.where(user: current_user)
    @contributor_role_notes = User.contributor_role_notes(current_user_id)
    @reader_role_notes = User.reader_role_notes(current_user_id)
  end
end
