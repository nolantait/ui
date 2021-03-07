module Ui
  class Pagination < Component
    class Page < Value
      attribute :position, Types::Strict::Integer
      attribute :path, Types::Strict::String
      attribute :current, Types::Strict::Bool
    end

    class PageGroup < Value
      attribute :pages, Types::Array.of(Page)
      attribute :position, Types::Strict::Integer
    end

    def show
      render
    end

    private

    def previous_page_link
      cell(
        Ui::Buttons::Secondary,
        nil,
        path: previous_page_path,
        disabled: previous_page.nil?,
        icon: 'fas fa-chevron-left'
      )
    end

    def previous_page_path
      previous_page.try(:path)
    end

    def next_page_link
      cell(
        Ui::Buttons::Secondary,
        nil,
        path: next_page_path,
        disabled: next_page.nil?,
        icon: 'fas fa-chevron-right'
      )
    end

    def next_page_path
      next_page.try(:path)
    end

    def page_links
      page_groups.inject('') do |content, page_group|
        content += cell(
          Ui::Pagination::Window,
          page_group,
          page_groups: page_groups
        ).()
      end
    end

    def page_groups
      pages.each_slice(window_size).to_a.map.with_index do |slice, index|
        PageGroup.new(
          pages: slice,
          position: index + 1
        )
      end
    end

    def pages
      model.map.with_index do |page, index|
        Page.new(
          position: index + 1,
          path: page,
          current: page == current_path
        )
      end
    end

    def current_page
      pages.find(&:current)
    end

    def next_page
      pages.find do |page|
        page.position == current_page.position + 1
      end
    end

    def previous_page
      pages.find do |page|
        page.position == current_page.position - 1
      end
    end

    def current_path
      options[:current_path]
    end

    def window_size
      options.fetch(:window_size, 5)
    end

    def disabled(content)
      content_tag(:button, content, disabled: true)
    end
  end
end
