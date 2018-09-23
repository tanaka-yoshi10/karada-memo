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
    unless current_user.family.bodies.exists?(@note.body_id)
      @note.body = nil
    end
    if @note.save
      redirect_to @note, success: 'メモを作成しました'
    else
      render :new
    end
  end

  def update
    @note.attributes = note_params
    unless current_user.family.bodies.exists?(@note.body_id)
      @note.body = nil
    end
    if @note.save
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
    @body = current_user.family.bodies.find_by(id: params[:body_id])
  end

  def set_note
    @note = current_user.family.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:detail, :noted_at, :body_id)
  end
end
