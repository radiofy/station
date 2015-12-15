module Station
  class R181FMRock40 < Format::Shoutcast
    config do
      id "181-fm-rock-40"
      url "http://relay.181.fm:8028/"
      exclude ["181.Fm", "Music Man", "1fm30"]
    end
  end
end