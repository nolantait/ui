module Ui
  module Actionable
    def actions
      content_tag(:nav, class: 'ui-actions', role: 'navigation') do
        render_group(
          options.fetch(:actions, Array.new).map do |action|
            action.call(model)
          end
        )
      end
    end

    def actions_length
      options.fetch(:actions, Array.new).size
    end

    def has_actions?
      options.fetch(:actions, []).any?
    end
  end
end
