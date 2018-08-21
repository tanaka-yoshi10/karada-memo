module ApplicationHelper
  def glyphicon(name)
    tag :span, class: "glyphicon glyphicon-#{name}", 'aria-hidden': 'true'
  end
end
