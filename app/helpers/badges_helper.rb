module BadgesHelper
  def form_header(badge)
    if badge.new_record?
      'Create new badge'
    else
      "Edit #{badge.title}"
    end
  end
end
