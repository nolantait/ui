module Ui
  module Actionable
    Actions = Types::Array.default([].freeze).of(Types::Callable)

    def actions
      content_tag(:nav, class: 'ui-actions', role: 'navigation') do
        render_group(
          actions_list.map do |action|
            action.call(model)
          end
        )
      end
    end

    def actions_list
      begin
        Actions[options.fetch(:actions, Array.new)]
      rescue Dry::Types::ConstraintError
        raise Ui::Errors::InvalidActions.new(
          "Actions for #{self.class.to_s} are invalid. Ensure you are passing " \
          "an array of callable objects that will be passed a model"
        )
      end
    end

    def actions_length
      options.fetch(:actions, Array.new).size
    end

    def has_actions?
      actions_list.any?
    end
  end
end
