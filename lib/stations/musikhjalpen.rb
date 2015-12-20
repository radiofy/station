module Station
  class Musikhjalpen < Format::SR
    config do
      id "musikhjalpen"
      url "http://api.sr.se/api/v2/playlists/rightnow?channelid=164"
      disabled true
    end
  end
end