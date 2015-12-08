require_relative "../classes/json"

module Station
  class Ilikeradio < Base::JSON
    def process
      thing   = data.select{ |ss| ss.fetch("id") == args.fetch(:id) }.first
      track  = thing && thing.fetch("currentsong").fetch("song")
      artist = track && track.fetch("artist_name")
      song   = track && track.fetch("title")
      { artist: artist, song: song }
    end
  end
end