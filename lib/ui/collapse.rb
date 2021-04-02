require 'ui/collapse/panel'

module Ui
  class Collapse < Component
    def show
      component(:ul) do
        panels
      end
    end

    private

    def panels
      cell(
        Ui::Collapse::Panel,
        collection: model,
        **panel_options
      ).()
    end

    def panel_options
      {}.tap do |hash|
        hash[:actions] = options[:actions] if options[:actions]
      end
    end

    def component_style
      'ui-collapse'
    end
  end
end
