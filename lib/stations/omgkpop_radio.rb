require_relative "../classes/html"

module Station
  class OmgkpopRadio < XSPF
    def process
      data = super
      { artist: data[:song], song: data[:artist] }
    end
  end
end