module Ui
  # Included in all components to pass through data attributes through
  # options[:data]
  module Attributable

    private

    def user_defined_data_attributes
      options.fetch(:data, {})
    end

    def data_attributes
      flatten(component_data_attributes.merge(user_defined_data_attributes))
    end

    def flatten(hash)
      FlattenHash.call(hash)
    end

    def component_data_attributes
      raise NotImplementedError
    end
  end
end
