class BodiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_body, only: %i[show edit update destroy]
  before_action :set_year, only: %i[show]

  def show
    @notes = @body.notes.noted_in(@year).page params[:page]
  end

  def new
    @body = Body.new
  end

  def edit
  end

  def create
    @body = current_user.family.bodies.build(body_params)
    if @body.save
      redirect_to family_url, success: 'からだを作成しました'
    else
      render :new
    end
  end

  def update
    if @body.update(body_params)
      redirect_to family_url, success: 'からだを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @body.destroy!
    redirect_to family_url, success: 'からだを削除しました'
  end

  private

  def set_body
    @body = current_user.family.bodies.find(params[:id])
  end

  def set_year
    @year = params[:year]
  end

  def body_params
    params.require(:body).permit(:nickname)
  end
end
