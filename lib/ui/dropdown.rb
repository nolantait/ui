module Ui
  # An interactive dropdown component that takes a menu which hides as a
  # dropdown activated when you click or hover on whatever block you give it
  class Dropdown < Component
    Modes = Types::String.enum(
      'click',
      'hover'
    )

    def show(&block)
      render(&block)
    end

    private

    def overlay
      model
    end

    def mode
      Modes[options.fetch(:mode, 'click')]
    end

    def component_style
      'ui-dropdown'
    end

    def component_data_attributes
      {
        action: 'click->dropdown#toggle',
        controller: 'dropdown',
        dropdown: {
          'hidden-class': 'hidden',
          'expanded-value': 'false',
          'mode-value': mode
        }
      }
    end
  end
end
