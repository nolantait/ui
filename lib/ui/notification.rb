module Ui
  # Notifications for actions and events
  class Notification < Component
    def show
      render
    end

    private

    def content
      model
    end

    def notification_icon
      return unless options.fetch(:icon, false)

      content_tag(:span, class: 'ui-notification__icon') do
        icon(options[:icon])
      end
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
      'ui-notification'
    end

    def component_data_attributes
      {
        controller: 'notification',
        'notification-hidden-class': 'hidden'
      }
    end
  end
end
