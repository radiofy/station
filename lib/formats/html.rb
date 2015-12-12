require_relative "./base"

module Station
  module Format
    class HTML < Base
      def data
        Nokogiri::HTML(super)
      end
    end
  end
end