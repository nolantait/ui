module Ui
  # Hides content depending on progress through a wizard. Like a form with steps
  class Wizard < Component
    class Step < Value
      attribute :position, Types::Strict::Integer
      attribute :content, Types::Strict::String
    end

    def show
      render
    end

    private

    def content
      cell(
        Ui::Wizard::Content,
        collection: wizard_steps
      )
    end

    def wizard_steps
      model.map.with_index do |step, index|
        Step.new(
          position: index + 1,
          content: step.fetch(:content, '')
        )
      end
    end

    def steps
      cell(
        Ui::Steps,
        model,
        current_step: current_step
      )
    end

    def controls
      content_tag(:nav, class: 'ui-wizard__controls') do
        render_group([
          next_button,
          finish_button,
          previous_button
        ])
      end
    end

    def finish_button
      content_tag(
        :div,
        options[:finish],
        data: {
          'wizard-target': 'finish'
        }
      )
    end

    def previous_button
      cell(
        Ui::Buttons::Secondary,
        'Previous',
        path: '#',
        data: {
          action: 'click->wizard#previous',
          'wizard-target': 'previous'
        }
      )
    end

    def next_button
      cell(
        Ui::Buttons::Secondary,
        'Next',
        path: '#',
        id: 'next',
        data: {
          action: 'click->wizard#next',
          'wizard-target': 'next'
        }
      )
    end

    def current_step
      options.fetch(:current_step, 1)
    end

    def component_data_attributes
      {
        controller: 'wizard',
        wizard: {
          'hidden-class': 'hidden',
          'current-step-class': 'ui-step--current',
          'step-position-value': '1'
        }
      }
    end
  end
end
