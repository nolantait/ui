module Ui
  module Actionable
    def actions
      if context
        context.fetch(:actions, Array.new)
      else
        Array.new
      end
    end

    def render_actions
      actions.map do |action|
        action.call(model)
      end.join(' ')
    end
  end
end
