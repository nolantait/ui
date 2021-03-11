module Ui
  class Notification < Component
    include Actionable
    include Stylable

    def show
      render
    end

    private

    def content
      model
    end

    def notification_icon
      content_tag(:span, class: 'ui-notification__icon') do
        icon(options[:icon])
      end if options[:icon]
    end

    def close_notification_link
      content_tag(
        :span,
        icon('fas fa-times'),
        class: 'ui-notification__close',
        data: {
          action: 'click->notification#toggle'
        }
      )
    end

    def component_style
      "ui-notification"
    end
  end
end
