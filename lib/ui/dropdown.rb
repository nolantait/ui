module Ui
  class Dropdown < Component
    Modes = Types::String.enum(
      'click',
      'hover'
    )

    def show(&block)
      render(&block)
    end

    private

    def overlay
      model
    end

    def mode
      Modes[options.fetch(:mode, 'click')]
    end
  end
end
