module Ui
  # A renderer for a single Ui::Steps::Step value object
  class Step < Component
    property :status
    property :position
    property :last?
    property :current?

    def show
      render
    end

    private

    def title
      content_tag(:p, model.title, class: 'ui-step__title')
    end

    def subtitle
      content_tag(:p, model.subtitle, class: 'ui-step__subtitle')
    end

    def description
      content_tag(:p, model.description, class: 'ui-step__description')
    end

    def step_icon
      return icon(model.icon) unless model.icon.blank?

      icon_for_status(status)
    end

    def icon_for_status(status)
      case status
      when 'finished'
        icon('fas fa-check')
      when 'processing'
        position
      when 'error'
        icon('fas fa-times')
      when 'waiting'
        position
      end
    end

    def render_icon
      content_tag(:span, step_icon, class: 'ui-step__icon')
    end

    def component_style
      ['ui-step'].tap do |styles|
        styles << 'ui-step--last' if last?
        styles << 'ui-step--current' if current?
        styles << "ui-step--#{status.downcase}"
      end.join(' ')
    end
  end
end
