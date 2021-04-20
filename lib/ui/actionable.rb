module Ui
  # Included in every component. Handles passing through actions from a view.
  # Actions can be things like buttons or links to display on a component.
  # Admins might want different links than a user so you can pass them through
  # options[:action]
  module Actionable
    Actions = Types::Array.default([].freeze).of(Types::Callable | Types::Strict::String)

    def actions(object = model)
      content_tag(:nav, class: 'ui-actions', role: 'navigation') do
        render_group(
          actions_list.map do |action|
            unwrap(action, object)
          end
        )
      end
    end

    def actions_list
      begin
        Actions[options.fetch(:actions, [])]
      rescue Dry::Types::ConstraintError
        raise Ui::Errors::InvalidActions,
          "Actions for #{self.class} are invalid. Ensure you are passing " \
          'an array of callable objects that will be passed a model'
      end
    end

    def unwrap(action, object)
      if action.is_a? Proc
        action.call(object)
      else
        action
      end
    end

    def actions_length
      options.fetch(:actions, []).size
    end

    def actions?
      actions_list.any?
    end
  end
end
