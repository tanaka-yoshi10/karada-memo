module ApplicationHelper
  def glyphicon(name)
    tag :span, class: "glyphicon glyphicon-#{name}", 'aria-hidden': 'true'
  end

  def error_explanation(object_with_errors)
    return if object_with_errors.errors.empty?

    messages = object_with_errors.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div id="error_explanation" class="alert alert-danger" role="alert">
      <ul>
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end
end
