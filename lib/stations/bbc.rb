module Station
  {
    "bbcradio1" => "radio-1",
    "bbcradio2" => "radio-2",
    "bbc6music" => "6music",
    "bbc1xtra" => "1xtra"
  }.each_pair do |key, station|
    Class.new(Format::BBC) do
      config do
        id key
        url "http://trackplaying.appspot.com/?brand=#{station}"
        disabled true
      end
    end
  end
end