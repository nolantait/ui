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
        unwrap(tooltip.fetch(:header, '')),
        style: 'ui-tooltip-container'
      ).() do
        unwrap(tooltip.fetch(:content, ''))
      end
    end

    def unwrap(content)
      if content.respond_to?(:call)
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
