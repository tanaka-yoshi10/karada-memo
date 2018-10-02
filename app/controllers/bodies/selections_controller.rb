class Bodies::SelectionsController < ApplicationController
  def index
    @bodies = current_user.family.bodies
    case @bodies.count
    when 0
      render 'nobody'
    when 1
      render visit_to(new_body_note_url(@bodies.first))
    end
  end

  private

  def visit_to(replace_url)
    { js: "Turbolinks.visit('#{replace_url}');" }
  end
end
