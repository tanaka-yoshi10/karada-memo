# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # FIXME: サインイン後のリダイレクト先を適切なページに変える。
  def after_sign_in_path_for(resource)
    '/fixme'
  end
end
