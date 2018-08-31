class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: :destroy
  before_action :require_destroyable, only: :destroy

  def destroy
    @user.destroy!
    redirect_to family_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def require_destroyable
    redirect_to root_url unless current_user.can_destroy?(@user)
  end
end
