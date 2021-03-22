module Ui
  module Buttons
    class Tertiary < Base
      private

      def component_style
        [
          'button--tertiary',
          super
        ].flatten
      end
    end
  end
end
