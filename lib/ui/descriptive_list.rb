module Ui
  class DescriptiveList < Component
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
      return unless display_header?

      content_tag(
        :header,
        render_group([
          options[:header],
          actions
        ])
      )
    end

    def display_header?
      options[:header] || actions?
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
