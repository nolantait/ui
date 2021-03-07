module Ui
  class List < Component
    class Item < Component
      def show
        content_tag(:li, model)
      end
    end
  end
end
