module Ui
  class Card < Component
    include Actionable
    include Stylable

    def show(&block)
      render(&block)
    end

    private

    def cover
      content_tag(:figure, class: 'ui-card__cover') do
        image_tag(options[:cover])
      end if options[:cover]
    end

    def card_actions
      actions if has_actions?
    end

    def title
      model
    end

    def extra
      options[:extra]
    end

    def component_style
      "ui-card"
    end
  end
end
