require_relative "../classes/html"

module Station
  class Shoutcast < Base::HTML
    def process
      tr =  data.css("tr").select do |tr|
        !! tr.to_s.match(/Current Song: /)
      end.first

      return nil unless tr

      fartist, fsong = split(tr.at_css("font.default b").content.to_s)

      {
        artist: fartist,
        song: fsong
      }
    end
  end
end