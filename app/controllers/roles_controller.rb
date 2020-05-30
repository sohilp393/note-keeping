# Roles-Controller
class RolesController < ApplicationController
  layout 'dashboard'
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @role = Role.new
    @role.user = User.where(name: role_params[:name]).first
    @role.note = Note.find(role_params[:note_id])
    @role.role = role_params[:role]
    if @role.save!
      redirect_to "/notes/#{role_params[:note_id]}"
    end
  end

  private

  def role_params
    params.require(:role).permit(:name, :role, :note_id)
  end
end
