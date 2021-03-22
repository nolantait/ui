module Ui
  class DescriptiveList < Component
    class Item < Component
      def show
        content_tag(
          :div,
          render_group([
            content_tag(:dt, item_title),
            content_tag(:dd, value)
          ]),
          class: 'ui-descriptive-list__item'
        )
      end

      def value
        render_group([
          display(item_value)
        ])
      end

      def display(value)
        if value.is_a?(Proc)
          value.call
        else
          value
        end
      end

      def item_title
        model[0]
      end

      def item_value
        model[1]
      end
    end
  end
end
