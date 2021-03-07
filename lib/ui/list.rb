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
      render_group(
        model.map { |item| renderable.call(item) }
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
  end
end
