module Ui
  module Buttons
    class Secondary < Base
      private

      def component_style
        [
          'button--secondary',
          super
        ].flatten
      end
    end
  end
end
