module Station
  class Radiosor < Format::HTML
    config do
      id "radiosor"
      url "http://radiosor.no/rs/wp-content/themes/original/nettradionaaalbum.php"
    end

    def process
      song = data.at_css(":nth-child(5)").try(:text)
      artist = data.at_css(":nth-child(4)").try(:text)
      { artist: artist, song: song }
    end
  end
end
