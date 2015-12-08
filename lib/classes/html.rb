require_relative "./base"
require "nokogiri"

module Station
  class HTML < Base
    def data
      Nokogiri::HTML(super)
    end
  end
end