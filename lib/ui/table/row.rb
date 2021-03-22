module Ui
  class Table < Component
    class Row < Component
      include Stylable

      def show
        content_tag(:tr, render_group(table_data), class: style)
      end

      private

      def component_style
        'ui-table__row'
      end

      def table_data
        columns.map do |column|
          content_tag(:td, apply(column))
        end
      end

      def apply(column)
        column[1].call(model)
      end

      def columns
        options.fetch(:columns, Array.new)
      end
    end
  end
end
