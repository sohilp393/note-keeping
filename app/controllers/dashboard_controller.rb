# Dash-Board Controller
class DashboardController < ApplicationController
  def allnotes
    @created_notes = Note.where(user_id: current_user.id)
    @contributor_notes = Role.where(
      user_id: current_user.id,
      role: 'Contributor')
    @reader_notes = Role.where(user_id: current_user.id, role: 'Reader')

    @allnotes_hash = {
      'Createdby' => @created_notes,
      'Contributor' => @contributor_notes,
      'Reader' => @reader_notes
    }
  end
end
