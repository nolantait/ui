module Ui
  class Breadcrumbs < Component
    class Crumb < Component
      property :name
      property :path
      property :current?

      def show
        content_tag(
          :span,
          name,
          class: style
        )
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
