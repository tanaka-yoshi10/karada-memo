# frozen_string_literal: true

class FamiliesController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :set_family, only: %i[show]

  def show
  end

  private

  def set_family
    @family = current_user.family
  end
end
