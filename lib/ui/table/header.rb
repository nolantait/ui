module Ui
  class Table < Component
    class Header < Component
      def show
        content_tag(:th, title)
      end

      private

      def title
        model[0]
      end
    end
  end
end
