require 'dry-types'

module Ui
  module Types
    include Dry.Types()

    Callable = Types.Interface(:call)
  end
end
