module Ui
  module Buttons
    class Base < Component
      def show
        display(
          text_with_icon(icon),
          path,
          button_options,
        )
      end

      def new
        display(
          text_with_icon(new_icon),
          path,
          button_options
        )
      end

      def edit
        display(
          text_with_icon(edit_icon),
          path,
          button_options
        )
      end

      def destroy
        display(
          text_with_icon(destroy_icon),
          path,
          button_options.merge({
            method: :delete,
            data: {
              confirm: 'Are you sure?'
            }
          }),
        )
      end

      private

      def display(*args)
        if disabled?
          button_to(*args)
        else
          link_to(*args)
        end
      end

      def new_icon
        'fas fa-plus'
      end

      def edit_icon
        'fas fa-edit'
      end

      def destroy_icon
        'fas fa-trash'
      end

      def button_classes
        [
          "button",
          style,
          options.fetch(:class, '')
        ].compact.join(' ')
      end

      def text
        content_tag(:span, model)
      end

      def text_with_icon(icon)
        if icon
          content_tag(:i, nil, class: icon) + text
        else
          text
        end
      end

      def style
        ''
      end

      def icon
        options[:icon]
      end

      def path
        options[:path]
      end

      def data
        options[:data]
      end

      def target
        options[:target]
      end

      def method
        options[:method] || :get
      end

      def disabled?
        options[:disabled]
      end

      def button_options
        {
          class: button_classes,
          disabled: disabled?,
          data: data,
          method: method
        }
      end
    end
  end
end
