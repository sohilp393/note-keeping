# frozen_string_literal: true
class RolesController < ApplicationController
  layout 'dashboard'
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @role = pre_create
    response_on_save(@role)
  end

  def destroy
    @role = Role.find(params[:id])
    @note_id = @role.note_id
    @role.destroy
    post_destroy(@note_id)
  end

  private

  def role_params
    params.require(:role).permit(:user_id, :role, :note_id)
  end

  def post_destroy(note_id)
    respond_to do |format|
      format.html do
        redirect_to "/notes/#{note_id}", notice: 'Role was destroyed'
      end
      format.json { head :no_content }
    end
  end

  def pre_create
    @role = Role.new
    @role.user = User.find(role_params[:user_id])
    @role.note = Note.find(role_params[:note_id])
    @role.role = role_params[:role]
    @role
  end

  def response_on_save(role)
    respond_to do |format|
      debugger
      if role.save 
        format.html do
          redirect_to "/notes/#{role_params[:note_id]}", notice: 'Role created'
        end
      else
        format.html { render '' }
      end
    end
  end
end
