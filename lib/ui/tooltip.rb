module Ui
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
  end
end
