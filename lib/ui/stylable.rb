module Ui
  # Adds user and class defined component styles to class attribute on component
  module Stylable
    private

    def user_defined_style
      options.fetch(:style, '')
    end

    def style
      [
        user_defined_style,
        component_style
      ].join(' ')
    end

    def component_style
      self.class.to_s
          .gsub('::', '')
          .underscore
          .split('_')
          .map(&:downcase)
          .join('-')
    end
  end
end
