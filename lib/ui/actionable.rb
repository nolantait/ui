module Ui
  module Actionable
    Actions = Types::Array.default([].freeze).of(Types::Callable)

    def actions
      content_tag(:nav, class: 'ui-actions', role: 'navigation') do
        render_group(
          Actions[actions_list].map do |action|
            action.call(model)
          end
        )
      end
    end

    def actions_list
      options.fetch(:actions, Array.new) || Array.new
    end

    def actions_length
      options.fetch(:actions, Array.new).size
    end

    def has_actions?
      options.fetch(:actions, []).any?
    end
  end
end
