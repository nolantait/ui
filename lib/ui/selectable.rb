module Ui
  # Module for List or Table selectable features
  module Selectable
    private

    def selectable_controller_attributes
      {
        controller: 'selectable',
        'selectable-selected-value': selectable_selected,
        'selectable-type-value': selectable_type
      }
    end

    def selectable?
      features.keys.include? :selectable
    end

    def selectable_selected
      selectable_options.fetch(:selected, '[]')
    end

    def selectable_type
      selectable_multi_select? ? 'many' : 'one'
    end

    def selectable_multi_select?
      selectable_options.fetch(:multiple, false)
    end

    def selectable_options
      features.fetch(:selectable, {})
    end

    def features
      options.fetch(:features, {})
    end
  end
end
