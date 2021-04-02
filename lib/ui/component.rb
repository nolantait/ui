module Ui
  # Base component which all others inherit from
  class Component < ::Cell::ViewModel
    include Layout::External
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    include Ui::Actionable
    include Ui::Attributable
    include Ui::Stylable

    VIEWPATH = Pathname.new(__FILE__).join('../..')
    view_paths << VIEWPATH

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

    def component(
      name = :article,
      content_or_options_with_block = nil,
      options = {},
      escape = true,
      &block
    )
      content = content_or_options_with_block
      content = yield.html_safe if block_given?

      content_tag(
        name,
        content,
        default_component_options.merge(options),
        escape
      )
    end

    def default_component_options
      {
        class: style,
        data: data_attributes
      }
    end

    def icon(style)
      content_tag(:i, nil, class: style)
    end

    def component_style
      ''
    end

    def component_data_attributes
      {}
    end
  end
end
