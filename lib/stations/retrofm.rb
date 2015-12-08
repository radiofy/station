module Station
  class Retrofm < Shoutcast
    def process
      c = super
      { song: c[:artist], artist: c[:song] }
    end
  end
end