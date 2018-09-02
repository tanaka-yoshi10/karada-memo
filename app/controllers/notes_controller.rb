class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_body, only: %i[new]
  before_action :set_note, only: %i[show edit update destroy]

  def index
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
      redirect_to @note, success: 'メモを作成しました'
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      redirect_to @note, success: 'メモを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to @note.body, success: 'メモを削除しました'
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
