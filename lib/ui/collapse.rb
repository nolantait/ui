require "ui/collapse/panel"

module Ui
  class Collapse < Component
    include Stylable

    def show
      content_tag(:ul, panels, class: style)
    end

    private

    def panels
      cell(
        Ui::Collapse::Panel,
        collection: model
      ).()
    end

    def component_style
      "ui-collapse"
    end
  end
end
