module Ui
  class Pagination < Component
    class Window < Component
      property :pages
      property :position

      def show
        content_tag(
          :ul,
          render_group([
            previous_window,
            page_links.html_safe,
            next_window
          ]),
          class: 'ui-pagination__window',
          data: {
            position: position,
            "pagination-target": "windows"
          }
        )
      end

      private

      def next_window
        unless last_window?
          content_tag(:li, next_window_button)
        end
      end

      def next_window_button
        cell(
          Ui::Buttons::Secondary,
          nil,
          icon: 'fas fa-ellipsis-h',
          data: {
            action: "click->pagination#next"
          }
        )
      end

      def previous_window
        unless first_window?
          content_tag(:li, previous_window_button)
        end
      end

      def previous_window_button
        cell(
          Ui::Buttons::Secondary,
          nil,
          icon: 'fas fa-ellipsis-h',
          data: {
            action: "click->pagination#previous"
          }
        )
      end


      def page_links
        pages.inject('') do |content, page|
          content += content_tag(
            :li,
            cell(
              Ui::Pagination::PageLink,
              page
            ).()
          )
        end
      end

      def last_window?
        position == page_groups.size
      end

      def first_window?
        position == 1
      end

      def page_groups
        options[:page_groups]
      end
    end
  end
end
