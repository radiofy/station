module Station
  class Musikmixen < Format::JSON
    config do
      id "musikmixen"
      url "http://www.musikmixen.se/index.php?option=com_sam2joom&view=nowplaying&format=raw"
    end

    def process
      { artist: data["artist"], song: data["title"] }
    end
  end
end
