require 'ui/table/header'
require 'ui/table/row'
require 'ui/table/vertical'

module Ui
  # Renders tables using predefined data and columns
  class Table < Component
    include Sortable
    include Selectable
    include ::Cell::Builder

    builds do |_model, options|
      case options.fetch(:orientation, 'horizontal')
      when 'vertical'
        Ui::Table::Vertical
      else
        self
      end
    end

    def show
      render
    end

    private

    def table
      content_tag(:table, data: table_data_attributes) do
        render_group([
          content_tag(:thead, table_headers),
          content_tag(:tbody, table_rows, data: table_body_data_attributes)
        ])
      end
    end

    def table_headers
      if custom_header_renderer.is_a?(Proc)
        custom_table_headers
      else
        default_table_headers
      end
    end

    def custom_table_headers
      render_group(
        columns.map do |column|
          custom_header_renderer.call(column)
        end
      )
    end

    def default_table_headers
      content_tag(:tr) do
        cell(
          Ui::Table::Header,
          collection: columns
        ).()
      end
    end

    def table_rows
      if model.any?
        display_table_rows
      else
        render_empty
      end
    end

    def display_table_rows
      if custom_row_renderer.is_a?(Proc)
        custom_table_rows
      else
        default_table_rows
      end
    end

    def custom_table_rows
      render_group(
        model.map do |row|
          custom_row_renderer.call(row, columns)
        end
      )
    end

    def default_table_rows
      cell(
        Ui::Table::Row,
        collection: model,
        columns: columns
      ).()
    end

    def table_data_attributes
      return {} unless selectable?

      selectable_controller_attributes
    end

    def table_body_data_attributes
      return {} unless sortable?

      sortable_controller_attributes
    end

    def header
      return unless options[:header] || actions

      content_tag(
        :header,
        render_group([
          options[:header],
          actions
        ])
      )
    end

    def footer
      return unless options.fetch(:footer, false)

      content_tag(
        :footer,
        options[:footer]
      )
    end

    def columns
      @columns ||= options.fetch(:columns, []).tap do |columns|
        columns.unshift(selectable_column) if selectable?
        columns.unshift(sortable_column) if sortable?
      end
    end

    def selectable_column
      [
        -> { select_all },
        ->(data) { cell(Ui::Table::Select, data, selectable_options) }
      ]
    end

    def sortable_column
      [
        -> { nil },
        ->(data) { cell(Ui::Table::Sort, data, sortable_options) }
      ]
    end

    def select_all
      cell(Ui::Table::SelectAll, nil) if selectable_multi_select?
    end

    def custom_row_renderer
      options.fetch(:row_renderer, nil)
    end

    def custom_header_renderer
      options.fetch(:header_renderer, nil)
    end

    def render_empty
      content_tag(:tr, empty)
    end

    def empty
      content_tag(
        :td,
        cell(
          Ui::Empty,
          nil
        ).(),
        colspan: columns.size
      )
    end

    def component_style
      'ui-table ui-table--horizontal'
    end
  end
end
