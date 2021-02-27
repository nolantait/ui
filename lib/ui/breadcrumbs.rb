module Ui
  class Breadcrumbs < Component
    Breadcrumb = Types.Interface(:name, :path, :current?)

    def show
      content_tag(:nav, class: 'ui-breadcrumbs') do
        breadcrumb_links
      end
    end

    private

    def breadcrumbs
      Types::Array.of(Breadcrumb)[model]
    end

    def breadcrumb_links
      breadcrumbs.map.with_index do |crumb, index|
        [item_renderer.call(crumb)].tap do |renderable|
          renderable.unshift(delimiter) unless index == 0
        end
      end.flatten.join(' ').html_safe
    end

    def delimiter
      options[:delimiter] || content_tag(:span, '>', class: 'breadcrumb-delimiter')
    end

    def item_renderer
      options[:item_renderer] || Ui::Breadcrumbs::Crumb
    end
  end
end
