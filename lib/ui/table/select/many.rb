module Ui
  class Table < Component
    class Select < Component
      class Many < Component
        def show
          check_box_tag(
            name,
            value,
            selected,
            disabled: disabled,
            data: {
              "selectable-target": "input",
              action: "click->selectable#select"
            }
          )
        end

        private

        def name
          "row[selected]"
        end

        def value
          model
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
end
