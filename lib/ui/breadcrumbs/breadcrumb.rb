module Ui
  class Breadcrumbs < Component
    # An individual breadcrumb
    class Breadcrumb < Component
      include Stylable

      property :name
      property :path
      property :current?
      property :icon

      def show
        component(:span) do
          link_to(render_group(title), path)
        end
      end

      private

      def title
        [content_tag(:span, name)].tap do |array|
          array.unshift(content_tag(:i, nil, class: icon)) if icon?
        end
      end

      def icon?
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
