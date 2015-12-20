module Station
  class Netrock101 < Format::JSON
    config do
      id "netrock101"
      url "http://radionomy.letoptop.fr/ajax/ajax_titre.php?radiouid=be28f9b6-33e2-4849-bc2e-e0a6e4b05aa3"
    end

    def process
      { song: data["titre"], artist: data["artiste"] }
    end
  end
end