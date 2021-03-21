module Ui
  class Table < Component
    class Vertical < Table

      private

      def table_rows
        if model.any?
          cell(
            row_renderer,
            collection: columns[1..-1],
            data: model
          )
        else
          render_empty
        end
      end

      def table_headers
        content_tag(:tr) do
          render_group([
            content_tag(:th, columns[0].try(:first)),
            cell(
              header_renderer,
              collection: model,
              column: columns[0],
            )
          ])
        end
      end

      def row_renderer
        Ui::Table::Vertical::Row
      end

      def header_renderer
        Ui::Table::Vertical::Header
      end

      def component_style
        "ui-table ui-table--vertical"
      end
    end
  end
end
