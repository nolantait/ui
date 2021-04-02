module Ui
  # An on hover tooltip to show helpful ui hints or information
  class Tooltip < Component
    def show(&block)
      render(&block)
    end

    private

    def content
      cell(
        Ui::Card,
        display(tooltip.fetch(:header, '')),
        style: 'ui-tooltip-container'
      ).() do
        display(tooltip.fetch(:content, ''))
      end
    end

    def display(content)
      if content.is_a?(Proc)
        content.call
      else
        content
      end
    end

    def tooltip
      context.fetch(:tooltip, {})
    end

    def mode
      tooltip.fetch(:mode, 'hover')
    end

    def component_data_attributes
      {
        action: 'click->tooltip#toggle',
        controller: 'tooltip',
        tooltip: {
          'hidden-class': 'hidden',
          'mode-value': mode,
          'expanded-value': false
        }
      }
    end
  end
end
