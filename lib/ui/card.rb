module Ui
  class Card < Component
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
      actions if actions?
    end

    def title
      model
    end

    def has_title?
      model && !model.blank?
    end

    def has_extra?
      extra
    end

    def extra
      options[:extra]
    end

    def component_style
      "ui-card"
    end
  end
end
