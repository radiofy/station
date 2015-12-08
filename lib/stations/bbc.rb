require_relative "../classes/xml"

module Station
  class Bbc < Base::XML
    def process
      artist, song = split(data.at_css("#track").try(:content).to_s)
      { artist: song, song: song}
    end
  end
end