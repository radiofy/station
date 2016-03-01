module Station
  class TheBeat < Format::HTML
    config do
      id "thebeat"
      url "http://marci1705.getmarci.com/"
    end

    def process
      {
        artist: data.at_css("#block1 .artist").text,
        song: data.css("#block1 .title").text
      }
    end
  end
end
