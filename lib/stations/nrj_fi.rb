module Station
  [ "nrj_rap_us",
    "nrj_dance",
    "nrj_rock",
    "nrj_uk_top_40",
    "nrj_lounge",
    "nrj_running_hits_for_running",
    "nostalgia_finlande",
    "nrj_rnb",
    "energy",
    "nrj_fitness",
    "nrj_latino",
    "nrj_love",
    "nrj_ibiza",
    "nrj_nostalgia",
    "nrj_suomihitit",
    "nrj_hits",
    "nrj_mastermix_extravadance"
  ].each do |station|
    Class.new(Format::JSON) do
      config do
        id "fi_#{station}"
        url "http://nrj.fi/wp-content/json/all_stations.json"
        args [station]
      end

      def process(id)
        return unless track = data[id]
        return unless current = track["current_item"]

        {
          artist: current["artist"],
          song: current["song"]
        }
      end
    end
  end
end