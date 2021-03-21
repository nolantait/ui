module Ui
  class Table < Component
    class Vertical < Table
      class Row < Ui::Table::Row

        private

        def table_data
          data.map do |item|
            content_tag(:td, apply(item))
          end.tap do |array|
            array.unshift(content_tag(:th, column_title))
          end
        end

        def apply(item)
          column[1].call(item)
        end

        def column
          model
        end

        def column_title
          column[0]
        end

        def data
          options.fetch(:data, Array.new)
        end
      end
    end
  end
end
