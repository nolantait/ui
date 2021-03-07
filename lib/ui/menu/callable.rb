module Ui
  class Menu < Component
    class Callable < Item
      private

      def render_item
        model.call(self)
      end
    end
  end
end
