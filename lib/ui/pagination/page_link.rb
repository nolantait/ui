module Ui
  class Pagination < Component
    class PageLink < Component
      property :position
      property :current
      property :path

      def show
        cell(
          Ui::Buttons::Secondary,
          position,
          path: path,
          style: style
        )
      end

      def style
        current ?
          'ui-pagination__page--current' :
          'ui-pagination__page'
      end
    end
  end
end
