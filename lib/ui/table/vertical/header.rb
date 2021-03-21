module Ui
  class Table < Component
    class Vertical < Table
      class Header < Ui::Table::Header
        def show
          content_tag(:th, title)
        end

        private

        def title
          case
          when column[1].is_a?(Proc)
            column[1].call(model)
          else
            model.to_s
          end
        end

        def column
          options[:column]
        end
      end
    end
  end
end
