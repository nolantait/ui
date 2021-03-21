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
      content_tag(:tr) do
        cell(
          header_renderer,
          collection: columns
        ).()
      end
    end

    def table_rows
      if model.any?
        cell(
          row_renderer,
          collection: model,
          columns: columns
        )
      else
        render_empty
      end
    end

    def table_data_attributes
      {
        controller: table_controllers,
        "selectable-selected-value": "[]",
        "selectable-type-value": multi_select? ? 'many' : 'one'
      }
    end

    def table_body_data_attributes
      {
        controller: table_body_controllers,
        "sortable-update-url-value": sortable_options.fetch(:update_url, '#'),
        "sortable-input-name-value": sortable_options.fetch(:input_name, "object[position]")
      }
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

    def row_renderer
      Ui::Table::Row
    end

    def header_renderer
      Ui::Table::Header
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
      "ui-table"
    end
  end
end
