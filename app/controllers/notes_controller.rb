# frozen_string_literal: true
# Performs CRUD operation on notes table
class NotesController < ApplicationController
  before_action :find_note, only: %i(show edit update destroy)
  layout 'note'

  def index
    @notes = Note.where(user: current_user).page(params[:page]).per(5)
  end

  def show
    @user_roles = Note.users_roles(params[:id])
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    pre_create(@note)
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was updated' }
        # format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was destroyed' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_note
    @note = Note.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to notes_url
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:title, :body)
  end

  def pre_create(note)
    respond_to do |format|
      if note.save
        format.html { redirect_to note, notice: 'Note was created' }
      else
        format.html { render :new }
      end
    end
  end
end
