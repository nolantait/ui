module Ui
  module Buttons
    class Primary < Base
      private

      def component_style
        [
          'button--primary',
          super
        ].flatten
      end
    end
  end
end
