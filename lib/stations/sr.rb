module Station
  file = File.join(File.dirname(__FILE__), "../lists/sr.xml")
  Nokogiri::XML(File.read(file)).css("channel").each do |channel|
    Class.new(Format::XML) do
      id = channel.attr("name").parameterize
      config do
        id id
        url "http://api.sr.se/api/v2/playlists/rightnow?channelid=#{channel.attr("id")}"
        if id.match(/extra\d+/)
          disabled true
        end
      end

      def process
        artist = data.at_css("artist").try(:text)
        song = data.at_css("title").try(:text)
        { artist: artist, song: song }
      end
    end
  end
end