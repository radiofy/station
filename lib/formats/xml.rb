require_relative "./base"

module Station
  module Format
    class XML < Base
      def data
        Nokogiri::XML(super)
      end
    end
  end
end