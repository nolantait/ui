module Ui
  module Buttons
    class Base < Component
      include Stylable

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

      def phone
        display(
          text_with_icon(phone_icon),
          "tel:#{path}",
          button_options
        )
      end

      def email
        mail_to(
          path,
          text_with_icon(email_icon),
          button_options
        )
      end

      private

      def display(*args)
        if disabled?
          content_tag(
            :button,
            args.first,
            disabled: true,
            class: style
          )
        else
          if path == '#'
            content_tag(:button, args.first, **args.last)
          else
            link_to(*args)
          end
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

      def phone_icon
        'fas fa-phone'
      end

      def email_icon
        'fas fa-envelope'
      end

      def size
        case options[:size]
        when :small
          'button--small'
        else
          ''
        end
      end

      def text
        content_tag(:span, model) unless model.nil?
      end

      def text_with_icon(icon)
        order = [text].tap do |array|
          case icon_position
          when 'end'
            array.push(display_icon(icon))
          else
            array.unshift(display_icon(icon))
          end
        end

        render_group(order)
      end

      def display_icon(icon)
        content_tag(:i, nil, class: icon) unless icon.blank?
      end

      def component_style
        [
          'button',
          size,
        ].join(' ')
      end

      def icon
        icon_options.fetch(:style, '')
      end

      def icon_position
        icon_options.fetch(:position, 'start')
      end

      def icon_options
        opts = options.fetch(:icon, {})
        opts.is_a?(Hash) ? opts : { style: opts }
      end

      def path
        options[:path] || '#'
      end

      def data
        options[:data] || {}
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
          class: style,
          disabled: disabled?,
          data: data,
          method: method
        }
      end
    end
  end
end
