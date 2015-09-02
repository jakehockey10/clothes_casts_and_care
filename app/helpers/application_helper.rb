module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Clothes, Casts, and Care'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def feedback_path_for_nav
    if admin_signed_in?
      feedbacks_path
    else
      new_feedback_path
    end
  end
end
