module ApplicationHelper
  def title(page_title = "")
    base_title = "codewithjulie"
    if page_title.empty?
      base_title
    else
      page_title
    end
  end

  
end
