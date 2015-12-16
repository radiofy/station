module Station
  class RadioVeronica < Format::XML
    config do
      id "radio-veronica"
      url "http://www.radioveronica.nl/cdn/player_veronica.xml"
    end

    def process
      { :song => (data.at_css("attribute[name=cue_title]").text), :artist => (data.at_css("attribute[name=track_artist_name]").text) }
    end
  end
end
