module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info' }[flash_type] || flash_type.to_s
  end

  # customize icons for each flash type
  def bootstrap_icon_for(flash_type)
    { success: 'ok', error: 'exclamation-sign', alert: 'warning-sign', notice: 'info-sign' }[flash_type] || 'question-sign'
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type.to_sym)} alert-dismissible", role: 'alert') do
        concat content_tag(:i, nil, class: "glyphicon glyphicon-#{bootstrap_icon_for(msg_type.to_sym)}")
        concat ' '
        concat message
      end)
    end
    nil
  end
end
