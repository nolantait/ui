module Ui
  class Breadcrumbs < Component
    include Stylable

    def show
      content_tag(:nav, render_group(breadcrumb_links.flatten), class: style)
    end

    private

    def breadcrumbs
      Types::Array.of(Crumb)[model]
    end

    def breadcrumb_links
      breadcrumbs.map.with_index do |crumb, index|
        [item_renderer.call(crumb)].tap do |array|
          array.unshift(delimiter) unless index == 0
        end
      end
    end

    def delimiter
      options[:delimiter] || content_tag(:span, '>', class: 'breadcrumb-delimiter')
    end

    def item_renderer
      options[:item_renderer] || default_item_renderer
    end

    def default_item_renderer
      ->(item) {
        cell(
          Ui::Breadcrumbs::Breadcrumb,
          item
        ).()
      }
    end

    def component_style
      'ui-breadcrumbs'
    end
  end
end
