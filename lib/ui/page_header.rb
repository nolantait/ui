module Ui
  class PageHeader < Component
    include Ui::Actionable

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
      link_to options[:back] do
        content_tag(:i, nil, class: 'fas fa-arrow-left')
      end if options[:back]
    end

    def breadcrumbs
      options.fetch(:breadcrumbs, Proc.new{}).call
    end
  end
end
