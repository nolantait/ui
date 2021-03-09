module Ui
  class Table < Component
    class SelectAll < Component
      def show
        check_box_tag(
          name,
          value,
          selected,
          disabled: disabled,
          data: {
            "selectable-target": "selectAll",
            action: "click->selectable#selectAll"
          }
        )
      end

      private

      def name
        "row[selected]"
      end

      def value
        ""
      end

      def selected
        options.fetch(:selected, false)
      end

      def disabled
        options.fetch(:disabled, false)
      end
    end
  end
end
