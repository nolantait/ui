module Ui
  module Actionable
    def actions
      options.fetch(:actions, Array.new).map do |action|
        action.call(model)
      end.join(' ')
    end

    def actions_length
      options.fetch(:actions, Array.new).size
    end

    def has_actions?
      options.fetch(:actions, false)
    end
  end
end
