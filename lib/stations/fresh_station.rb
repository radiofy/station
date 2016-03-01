module Station
  class FreshStation < Format::JSON
    config do
      id "fresh-station"
      url "http://radionomy.letoptop.fr/ajax/ajax_titre.php?radiouid=cf428a35-562a-44a0-b208-762dcaf554a3"
    end

    def process
      {
        song: data.fetch("titre"),
        artist: data.fetch("artiste")
      }
    end
  end
end
