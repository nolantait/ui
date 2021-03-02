module Ui
  class Breadcrumbs
    class Crumb < Dry::Struct
      attribute :name, Types::Strict::String
      attribute :path, Types::Strict::String.default('#'.freeze)
      attribute :current, Types::Strict::Bool.default(false.freeze)
      attribute :icon, Types::Strict::String.default(''.freeze)

      def current?
        current
      end
    end
  end
end

