class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_body, only: %i[new]
  before_action :set_note, only: %i[show edit update destroy]

  def index
    # FIXME: 現時点でビュー側で@notesは使われていない。扱いをあとで検討。
    @notes = current_user.family.notes
  end

  def show
  end

  def new
    @note = Note.new(body: @body)
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to @note.body, notice: 'Note was successfully destroyed.'
  end

  private

  def set_body
    @body = current_user.family.bodies.find(params[:body_id]) if params[:body_id].present?
  end

  def set_note
    @note = current_user.family.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:detail, :noted_at, :body_id)
  end
end
