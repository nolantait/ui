module Ui
  class Table < Component
    class Sort < Component
      def show
        content_tag(
          :div,
          icon(handle_icon),
          class: 'ui-sortable-handle',
        )
      end

      private

      def handle_icon
        options.fetch(:handle, 'fas fa-bars')
      end
    end
  end
end
