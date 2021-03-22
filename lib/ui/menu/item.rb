module Ui
  class Menu < Component
    class Item < Component
      include ::Cell::Builder

      builds do |item, options|
        if item.is_a? Proc
          Ui::Menu::Callable
        elsif item.is_a? Array
          Ui::Menu::Submenu
        else
          self
        end
      end

      def show
        content_tag(
          :li,
          render_item,
          class: style
        )
      end

      private

      def render_item
        model
      end

      def depth
        options[:depth] || 0
      end

      def style
        "ui-menu__item ui-menu__item--depth-#{depth}"
      end
    end
  end
end
