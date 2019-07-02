module ApplicationHelper
  def tooltip(key)
    return "<span class='fa fa-info-circle' data-tooltip-key=\"#{key}\"></span><div class='tooltip' data-tooltip-id=\"#{key}\"><span class=\"close fa fa-times-circle\"></span>#{I18n.t(key)}</div>".html_safe
  end
  
  def more(key)
    return "<span class='more-link' data-tooltip-key=\"#{key}\"> &mdash; More &mdash; </span> <div class=\"more\"  data-tooltip-id=\"#{key}\">#{I18n.t(key).html_safe}<div class=\"close close-link\"> &mdash; Less &mdash; </div></div>".html_safe
  end
end
