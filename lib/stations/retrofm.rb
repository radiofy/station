module Station
  class Retrofm < Format::Shoutcast
    config do
      id "retrofm"
      url "http://s1.retrofm.se:9000/index.html?sid=1"
    end

    def process
      return unless c = super
      { song: c[:artist], artist: c[:song] }
    end
  end
end