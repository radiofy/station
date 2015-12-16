module Station
  class Knac < Format::Raw
    config do
      id "knac"
      url "http://www.knac.com/text1.txt"
    end

    def process
      song = data.match(/<current_song>(.+)$/).to_a[1]
      artist = data.match(/<current_artist>(.+)$/).to_a[1]
      { :song => (song), :artist => (artist) }

    end
  end
end
