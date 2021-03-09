require "ui/table/select/one"
require "ui/table/select/many"

module Ui
  class Table < Component
    class Select < Component
      include ::Cell::Builder

      builds do |model, options|
        options.fetch(:multiple, false) ?
          Ui::Table::Select::Many :
          Ui::Table::Select::One
      end
    end
  end
end
