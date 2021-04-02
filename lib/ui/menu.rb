module Ui
  class Menu < Component
    def show
      render
    end

    private

    def header
      content_tag(:header, options[:header]) if options[:header]
    end

    def items
      content_tag(
        :ul,
        cell(
          Ui::Menu::Item,
          collection: model
        ).()
      )
    end

    def component_style
      'ui-menu'
    end
  end
end
