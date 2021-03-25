module Ui
  class Breadcrumbs < Component
    class Breadcrumb < Component
      include Stylable

      property :name
      property :path
      property :current?
      property :icon

      def show
        content_tag(
          :span,
          link_to(render_group(title), path),
          class: style
        )
      end

      private

      def title
        [content_tag(:span, name)].tap do |array|
          array.unshift(content_tag(:i, nil, class: icon)) if has_icon? 
        end
      end

      def has_icon?
        model.try(:icon)
      end

      def component_style
        ['ui-breadcrumb'].tap do |array|
          array << 'ui-breadcrumb--current' if current?
        end.join(' ')
      end
    end
  end
end
