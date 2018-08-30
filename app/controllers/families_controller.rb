# frozen_string_literal: true

class FamiliesController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :set_family, only: %i[show destroy]

  def show
  end

  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_url, success: '家族を削除しました' }
      format.json { head :no_content }
    end
  end

  private

  def set_family
    @family = current_user.family || Family.find(params[:id])
  end

end
