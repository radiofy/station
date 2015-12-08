require_relative "../classes/jsonp"

module Station
  class Radioplay < Base::JSONP
    def process
      return unless data = data[args.fetch(:id)]
      {
        song: data["title"].try(:gsub, /^Pi?\d+ - /i, ""),
        artist: data["artist"]
      }
    end
  end
end