class BodiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_body, only: %i[show edit update destroy]

  def show
  end

  def new
    @body = Body.new
  end

  def edit
  end

  def create
    @body = Body.new(body_params)
    @body.family = current_user.family
    if @body.save
      redirect_to family_url, notice: 'Body was successfully created.'
    else
      render :new
    end
  end

  def update
    if @body.update(body_params)
      redirect_to family_url, notice: 'Body was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @body.destroy
    redirect_to family_url, notice: 'Body was successfully destroyed.'
  end

  private

  def set_body
    @body = current_user.family.bodies.find(params[:id])
  end

  def body_params
    params.require(:body).permit(:nickname)
  end
end
