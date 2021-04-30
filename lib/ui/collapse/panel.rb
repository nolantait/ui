module Ui
  class Collapse < Component
    class Panel < Component
      def show
        render
      end

      private

      def collapse_icon
        content_tag(
          :div,
          icon('fas fa-chevron-down'),
          data: {
            'collapsable-target': 'icon'
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
        if item.respond_to?(:call)
          item.call
        else
          item
        end
      end

      def component_style
        'ui-collapse-panel'
      end

      def component_data_attributes
        {
          controller: 'collapsable',
          'collapsable-hidden-class': 'hidden',
          'collapsable-collapsed-value': collapsed?,
          'collapsable-collapsed-class': 'ui-collapsed'
        }
      end

      def collapsed?
        options.fetch(:collapsed, true).to_s
      end
    end
  end
end
