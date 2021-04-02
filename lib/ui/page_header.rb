module Ui
  # A page header for titles and page specific actions
  class PageHeader < Component
    def show(&block)
      render(&block)
    end

    private

    def title
      content_tag(:h1, model)
    end

    def subheading
      content_tag(:h2, options[:subheading]) if options[:subheading]
    end

    def back_button
      return unless options[:back]

      link_to options[:back] do
        content_tag(:i, nil, class: 'fas fa-arrow-left')
      end
    end

    def breadcrumbs
      options.fetch(:breadcrumbs, -> {}).call
    end

    def component_style
      'ui-page-header'
    end
  end
end
