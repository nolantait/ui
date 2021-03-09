require "ui/table/header"
require "ui/table/row"

module Ui
  class Table < Component
    include Actionable
    include Stylable

    def show
      render
    end

    private

    def table
      render
    end

    def table_headers
      content_tag(:tr) do
        cell(
          Ui::Table::Header,
          collection: columns
        ).()
      end
    end

    def table_rows
      cell(
        Ui::Table::Row,
        collection: rows,
        columns: columns
      )
    end

    def header
      content_tag(
        :header,
        render_group([
          options[:header],
          actions
        ])
      ) if options[:header] || has_actions?
    end

    def footer
      content_tag(
        :footer,
        options[:footer]
      ) if options[:footer]
    end

    def component_style
      "ui-table"
    end

    def columns
      options.fetch(:columns, Array.new)
    end

    def rows
      model
    end
  end
end
