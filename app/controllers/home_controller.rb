class HomeController < ApplicationController
  def index
    redirect_to notes_latests_url if user_signed_in?
  end
end
