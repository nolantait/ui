module Ui
  class Component < ::Cell::ViewModel
    include Layout::External
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    VIEWPATH = Pathname.new(__FILE__).join("../..")
    self.view_paths << VIEWPATH

    def capture(*args)
      content = yield(*args)
      if content.is_a?(String)
        content.html_safe
      else
        content
      end
    end

    def render_group(items)
      items.compact.join(' ').html_safe
    end

    def icon(style)
      content_tag(:i, nil, class: style)
    end
  end
end
