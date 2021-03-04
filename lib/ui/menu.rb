module Ui
  class Menu < Component
    def show
      content_tag(:ul, class: 'ui-menu') do
        model.inject('') do |content, item|
          content += content_tag(:li, item.call(self))
        end
      end
    end
  end
end
