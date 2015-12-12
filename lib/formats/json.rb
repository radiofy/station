require_relative "./base"

module Station
  module Format
    class JSON < Base
      def data
        super.present? ? ::JSON.parse(super) : {}
      end
    end
  end
end