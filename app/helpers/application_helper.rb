module ApplicationHelper

  def render_footer
    if current_page?(id: 'home') 
      render 'shared/large_footer'
    else
      render 'shared/small_footer'
    end
  end

end

