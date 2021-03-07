module Ui
  class Wizard < Component
    class Content < Component
      property :content
      property :position

      def show
        content_tag(
          :section,
          content,
          class: 'ui-wizard__content',
          data: {
            position: position,
            "wizard-target": "content"
          }
        )
      end
    end
  end
end
