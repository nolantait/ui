module Ui
  module Actionable
    def actions
      options.fetch(:actions, Array.new).map do |action|
        action.call(model)
      end.join(' ')
    end
  end
end
