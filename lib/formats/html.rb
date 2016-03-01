require_relative "./base"

module Station
  module Format
    class HTML < Base
      def data
        @_data ||= Nokogiri::HTML(super)
      end
    end
  end
end