module Ui
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
      raise NotImplementedError
    end
  end
end
