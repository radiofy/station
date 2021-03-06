require_relative "./base"

module Station
  module Format
    class JSONP < Base
      def data
        json = super.gsub(/^(\s*[a-zA-Z_0-9\.]*\()|(\);?\s*$)/, "")
        ::JSON.parse(json) if json
      end
    end
  end
end