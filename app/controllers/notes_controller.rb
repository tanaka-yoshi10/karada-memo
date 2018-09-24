class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_body, only: %i[create update]
  before_action :set_note, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    body = current_user.family.bodies.find_by(id: params[:body_id])
    @note = Note.new(body: body)
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.body = @body
    if @note.save
      redirect_to @note, success: 'メモを作成しました'
    else
      render :new
    end
  end

  def update
    @note.attributes = note_params
    @note.body = @body
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
    @body = current_user.family.bodies.find_by(id: params.require(:note).permit(:body_id)[:body_id])
  end

  def set_note
    @note = current_user.family.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:detail, :noted_at)
  end
end
