module Ui
  class Steps < Component
    include Stylable

    class Step < Value
      attribute :position, Types::Strict::Integer
      attribute :title, Types::Strict::String
      attribute? :icon, Types::Strict::String.default(''.freeze)
      attribute? :current, Types::Strict::Bool.default(false.freeze)
      attribute? :last, Types::Strict::Bool.default(false.freeze)
      attribute? :description, Types::Strict::String.default(''.freeze)
      attribute? :subtitle, Types::Strict::String.default(''.freeze)
      attribute? :status, Types::String.default('waiting'.freeze).enum(
        'finished',
        'processing',
        'waiting',
        'error'
      )

      def last?
        last
      end

      def current?
        current
      end
    end

    def show
      render
    end

    private

    def render_steps
      cell(
        Ui::Step,
        collection: steps,
        current_step: current_step
      )
    end

    def steps
      model.map.with_index do |step, index|
        Step.new(step.merge({
          current: current_step == index + 1,
          last: model.size == index + 1,
          position: index + 1
        }))
      end
    end

    def component_style
      ["ui-steps"].tap do |styles|
        styles << "ui-steps--#{direction}"
      end
    end

    def current_step
      options.fetch(:current_step, 1)
    end

    def direction
      options.fetch(:direction, 'horizontal')
    end
  end
end
