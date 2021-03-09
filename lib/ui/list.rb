module Ui
  class List < Component
    include Stylable
    include Actionable

    Renderable = Types.Interface(:call)

    def show
      render
    end

    private

    def list
      content_tag(:ul, list_items)
    end

    def list_items
      if list_data.any?
        render_group(list_data)
      else
        render_empty
      end
    end

    def list_data
      model.map do |item|
        renderable.call(item)
      end
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

    def renderable
      Renderable[options.fetch(:renderable, default_renderable)]
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
      cell(
        Ui::Empty,
        nil
      ).()
    end
  end
end
