module Ui
  class Collapse < Component
    class Panel < Component
      include Actionable

      def show
        render
      end

      private

      def collapse_icon
        content_tag(
          :div,
          icon('fas fa-chevron-down'),
          data: {
            "collapsable-target": "icon"
          }
        )
      end

      def header
        display(model[0])
      end

      def content
        display(model[1])
      end

      def display(item)
        if item.is_a?(Proc)
          item.call
        else
          item
        end
      end
    end
  end
end
