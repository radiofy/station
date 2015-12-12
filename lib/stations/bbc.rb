module Station
  {
    "bbcradio1" => "radio-1",
    "bbcradio2" => "radio-2",
    "bbc6music" => "6music",
    "bbc1xtra" => "1xtra"
  }.each_pair do |key, station|
    Class.new(Format::HTML) do
      config do
        id key
        url "http://trackplaying.appspot.com/?brand=#{station}"
      end

      def process
        artist, song = split(super.at_css("#track").try(:content).to_s)
        { artist: song, song: song }
      end
    end
  end
end