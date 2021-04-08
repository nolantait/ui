module Ui
  # Module for List or Table sortable features
  module Sortable
    private

    def sortable_controller_attributes
      {
        controller: 'sortable',
        'sortable-update-url-value': sortable_update_url,
        'sortable-input-name-value': sortable_input_name,
        'sortable-handle-class': sortable_handle_class
      }
    end

    def sortable?
      features.keys.include? :sortable
    end

    def sortable_handle_class
      sortable_options.fetch(:handle_class, 'ui-sortable-handle')
    end

    def sortable_update_url
      sortable_options.fetch(:update_url, '#')
    end

    def sortable_input_name
      sortable_options.fetch(:input_name, 'object[position]')
    end

    def sortable_options
      features.fetch(:sortable, {})
    end

    def features
      options.fetch(:features, {})
    end
  end
end
