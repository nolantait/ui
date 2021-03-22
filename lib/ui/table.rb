require "ui/table/header"
require "ui/table/row"
require "ui/table/vertical"

module Ui
  class Table < Component
    include Actionable
    include Stylable
    include ::Cell::Builder

    builds do |model, options|
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
      custom_header_renderer.is_a?(Proc) ?
        custom_table_headers :
        default_table_headers
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
        custom_row_renderer.is_a?(Proc) ?
          custom_table_rows :
          default_table_rows
      else
        render_empty
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
      {
        controller: table_controllers,
      }.tap do |hash|
        if selectable?
          hash["selectable-selected-value"] = "[]"
          hash["selectable-type-value"] = multi_select? ? 'many' : 'one'
        end
      end
    end

    def table_body_data_attributes
      {
        controller: table_body_controllers,
      }.tap do |hash|
        if sortable?
          hash["sortable-update-url-value"] =
            sortable_options.fetch(:update_url, '#')
          hash["sortable-input-name-value"] =
            sortable_options.fetch(:input_name, "object[position]")
        end
      end
    end

    def table_controllers
      [].tap do |array|
        array << "selectable" if selectable?
      end.join(' ')
    end

    def table_body_controllers
      [].tap do |array|
        array << "sortable" if sortable?
      end.join(' ')
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

    def columns
      @columns ||= options.fetch(:columns, Array.new).tap do |columns|
        columns.unshift(selectable_column) if selectable?
        columns.unshift(sortable_column) if sortable?
      end
    end

    def selectable_column
      [
        ->() { select_all },
        ->(data) { cell(Ui::Table::Select, data, selectable_options) }
      ]
    end

    def sortable_column
      [
        ->() { nil },
        ->(data) { cell(Ui::Table::Sort, data, sortable_options) }
      ]
    end

    def selectable?
      features.keys.include? :selectable
    end

    def sortable?
      features.keys.include? :sortable
    end

    def select_all
      cell(Ui::Table::SelectAll, nil) if multi_select?
    end

    def multi_select?
      selectable_options.fetch(:multiple, false)
    end

    def selectable_options
      features.fetch(:selectable, {})
    end

    def sortable_options
      features.fetch(:sortable, {})
    end

    def features
      options.fetch(:features, Hash.new)
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
          nil,
        ).(),
        colspan: columns.size
      )
    end

    def component_style
      "ui-table ui-table--horizontal"
    end
  end
end
