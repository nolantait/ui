module Ui
  class Breadcrumbs < Component
    class Breadcrumb < Component
      property :name
      property :path
      property :current?
      property :icon

      def show
        content_tag(
          :span,
          link_to(path) do
            title.html_safe
          end,
          class: style
        )
      end

      private

      def title
        [name].tap do |array|
          array.unshift(content_tag(:i, nil, class: icon)) if model.try(:icon)
        end.join(' ')
      end

      def style
        [
          'breadcrumb'
        ].tap do |array|
          array << 'breadcrumb--current' if current?
        end
      end
    end
  end
end
