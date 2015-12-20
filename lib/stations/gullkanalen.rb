module Station
  class Gullkanalen < Format::JSONP
    config do
      id "gullkanalen"
      url "https://cp9.shoutcheap.com:2199/external/rpc.php?callback=callback&m=streaminfo.get&username=mauest00&mountpoint=&rid=mauest00"
    end

    def perform
      track = data["data"].first["track"]
      return unless track
      { song: track["title"], artist: track["artist"] }
    end
  end
end

