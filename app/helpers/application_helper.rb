module ApplicationHelper

  #todo move and dont instantiate everytime
  def markdown(content)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    renderer.render(content).html_safe
  end
end
