# Dash-Board  Controller
class DashboardController < ApplicationController
  def index
    @created_notes = Note.where(user_id: current_user.id)
    @contributor_notes = Note.contributor_roles(current_user.id)
    @reader_notes = Note.reader_roles(current_user.id)
  end
end
