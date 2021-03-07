module Ui
  class Menu < Component
    class Submenu < Item
      private

      def render_item
        content_tag(
          :ul,
          render_group(subitems),
          data: {
            controller: 'dropdown',
            "dropdown-hidden-class": "hidden",
            "dropdown-expanded-value": false,
            "dropdown-mode-value": "click"
          }
        )
      end

      def subitems
        [
          content_tag(
            :div,
            render_group([
              cell(
                Ui::Menu::Item,
                model.first,
                depth: depth
              ),
              content_tag(:i, nil, class: 'fas fa-caret-down')
            ]),
            class: 'ui-submenu__header',
            data: {
              action: "click->dropdown#toggle"
            }
          ),
          content_tag(
            :div,
            cell(
              Ui::Menu::Item,
              collection: model.last,
              depth: depth + 1
            ),
            data: {
              "dropdown-target": "expandable"
            }
          )
        ]
      end

      def style
        'ui-submenu'
      end
    end
  end
end
