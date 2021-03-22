module Ui
  class DescriptiveList < Component
    class Item < Component
      def show
        content_tag(
          :div,
          render_group([
            content_tag(:dt, title),
            content_tag(:dd, value)
          ]),
          class: 'ui-descriptive-list__item'
        )
      end

      def title
        model[0]
      end

      def value
        model[1].try(:call) || model[1]
      end
    end
  end
end
