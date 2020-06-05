# frozen_string_literal: true
class DashboardController < ApplicationController
  def index
    current_user_id = current_user.id
    @contributor_role_notes =
      User.notes_roles(current_user_id, 'Contributor')
    @reader_role_notes = User.notes_roles(current_user_id, 'Reader')
  end
end
