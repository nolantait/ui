module Ui
  class Table < Component
    class Header < Component
      include Stylable

      def show
        content_tag(:th, title, class: style, **column_options)
      end

      private

      def component_style
        'ui-table__header'
      end

      def title
        if column_title.is_a?(Proc)
          column_title.call
        else
          column_title
        end
      end

      def column_title
        model[0]
      end

      def column_options
        model[2] || {}
      end
    end
  end
end
