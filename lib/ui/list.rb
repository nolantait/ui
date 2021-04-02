module Ui
  class List < Component
    Renderable = Types.Interface(:call)
    ListItems = Types.Interface(:each, :map, :any?)

    def show
      render
    end

    private

    def list_data
      begin
        ListItems[model]
      rescue Dry::Types::ConstraintError
        raise Ui::Errors::InvalidListItems,
          "List items for #{self.class} are invalid. Ensure you are passing " \
          'an empty array or array of items that will be passed to the item renderer'
      end
    end

    def list
      content_tag(:ul, list_items)
    end

    def list_items
      if rendered_items.any?
        render_group(rendered_items)
      else
        render_empty
      end
    end

    def rendered_items
      list_data.map do |item|
        content_tag(:li, item_renderer.call(item))
      end
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
      Renderable[options.fetch(:item_renderer, default_renderable)]
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
