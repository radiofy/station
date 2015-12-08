require_relative "./base"

module Station::Base
  class XML < Base
    def data
      Nokogiri::XML(super)
    end
  end
end