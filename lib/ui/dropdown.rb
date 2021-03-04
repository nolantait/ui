module Ui
  class Dropdown < Component
    def show(&block)
      render(&block)
    end

    private

    def overlay
      model
    end
  end
end
