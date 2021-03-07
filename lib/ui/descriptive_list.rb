module Ui
  class DescriptiveList < Component
    include Actionable
    include Stylable

    Directions = Types::String.enum(
      'horizontal',
      'vertical'
    )

    def show
      render
    end

    private

    def list_items
      cell(
        Ui::DescriptiveList::Item,
        collection: items
      )
    end

    def header
      content_tag(
        :header,
        render_group([
          content_tag(:h2, title),
          content_tag(:nav, actions)
        ])
      ) if title || has_actions?
    end

    def title
      options[:title]
    end

    def items
      model
    end

    def direction
      Directions[options.fetch(:direction, 'horizontal')]
    end

    def component_style
      "ui-descriptive-list ui-descriptive-list--#{direction}"
    end
  end
end
