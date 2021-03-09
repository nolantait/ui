module Ui
  class Table < Component
    class Header < Component
      def show
        content_tag(:th, title)
      end

      private

      def title
        case
        when model[0].is_a?(Proc)
          model[0].call
        else
          model[0]
        end
      end
    end
  end
end
