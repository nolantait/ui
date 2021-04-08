module Ui
  # A ui component for lists. Can be called with any callable ItemRenderer.
  class List < Component
    include Sortable

    ItemRenderer = Types.Interface(:call)
    ListItems = Types.Interface(:each, :map, :any?)

    def show
      render
    end

    private

    def list_data
      ListItems[model]
    rescue Dry::Types::ConstraintError
      raise Ui::Errors::InvalidListItems,
        "List items for #{self.class} are invalid. Ensure you are passing " \
        'an empty array or array of items that will be passed to the item renderer'
    end

    def list
      content_tag(:ul, list_items, data: list_data_attributes)
    end

    def list_data_attributes
      return unless sortable?

      sortable_controller_attributes
    end

    def list_items
      if rendered_items.any?
        render_group(rendered_items)
      else
        render_empty
      end
    end

    def rendered_items
      list_data.map.with_index do |item, index|
        content_tag(
          :li,
          item_renderer.call(item),
          data: { id: item_id(item, index)
          }
        )
      end
    end

    def item_id(item, index)
      item.try(:id) || index
    end

    def header
      return unless options[:header] || actions?

      content_tag(
        :header,
        render_group([
          options[:header],
          actions
        ])
      )
    end

    def footer
      return unless options[:footer]

      content_tag(
        :footer,
        options[:footer]
      )
    end

    def item_renderer
      ItemRenderer[options.fetch(:item_renderer, default_renderable)]
    end

    def default_renderable
      ->(item) {
        cell(
          Ui::List::Item,
          item
        ).()
      }
    end

    def component_style
      'ui-list'
    end

    def render_empty
      content_tag(:li, empty)
    end

    def empty
      options.fetch(:empty, default_empty)
    end

    def default_empty
      cell(
        Ui::Empty,
        nil
      ).()
    end
  end
end
