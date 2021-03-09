module Ui
  class Empty < Component
    include Stylable
    include Actionable

    def show
      render
    end

    private

    def image
      image_tag options[:image] if options[:image]
    end

    def display_icon
      icon(options.fetch(:icon, default_icon)) if options[:image].nil?
    end

    def default_icon
      "fas fa-inbox fa-5x"
    end

    def caption
      options.fetch(:caption, default_caption)
    end

    def default_caption
      content_tag(:p, 'No data')
    end

    def component_style
      "ui-empty"
    end
  end
end
