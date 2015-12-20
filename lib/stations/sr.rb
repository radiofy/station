module Station
  file = File.join(File.dirname(__FILE__), "../lists/sr.xml")
  Nokogiri::XML(File.read(file)).css("channel").each do |channel|
    Class.new(Format::SR) do
      id = channel.attr("name").parameterize
      config do
        id id
        url "http://api.sr.se/api/v2/playlists/rightnow?channelid=#{channel.attr("id")}"
        if id.match(/extra\d+/)
          disabled true
        end
      end
    end
  end
end