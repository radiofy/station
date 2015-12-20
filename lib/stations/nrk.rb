module Station
  [{
    id: "nrk-alltid-nyheter",
    url: "http://lyd.nrk.no/nrk_radio_alltid_nyheter_mp3_m.xspf"
  }, {
    id: "nrk-folkemusikk",
    url: "http://lyd.nrk.no/nrk_radio_folkemusikk_mp3_m.xspf"
  }, {
    id: "nrk-jazz",
    url: "http://lyd.nrk.no/nrk_radio_jazz_mp3_m.xspf"
  }, {
    id: "nrk-klassisk",
    url: "http://lyd.nrk.no/nrk_radio_klassisk_mp3_m.xspf"
  }, {
    id: "nrk-p13",
    url: "http://lyd.nrk.no/nrk_radio_p13_mp3_m.xspf"
  },{
    id: "nrk-p1-buskerud",
    url: "http://lyd.nrk.no/nrk_radio_p1_buskerud_mp3_m.xspf"
  },{
    id: "nrk-p1-finnmark",
    url: "http://lyd.nrk.no/nrk_radio_p1_finnmark_mp3_m.xspf"
  },{
    id: "nrk-p1-hedmark-og-oppland",
    url: "http://lyd.nrk.no/nrk_radio_p1_hedmark_og_oppland_mp3_m.xspf"
  },{
    id: "nrk-p1-hordaland",
    url: "http://lyd.nrk.no/nrk_radio_p1_hordaland_mp3_m.xspf"
  },{
    id: "nrk-p1-more-og-romsdal",
    url: "http://lyd.nrk.no/nrk_radio_p1_more_og_romsdal_mp3_m.xspf"
  },{
    id: "nrk-p1-nordland",
    url: "http://lyd.nrk.no/nrk_radio_p1_nordland_mp3_m.xspf"
  },{
    id: "nrk-p1-ostfold",
    url: "http://lyd.nrk.no/nrk_radio_p1_ostfold_mp3_m.xspf"
  },{
    id: "nrk-p1-ostlandssendingen",
    url: "http://lyd.nrk.no/nrk_radio_p1_ostlandssendingen_mp3_m.xspf"
  },{
    id: "nrk-p1-rogaland",
    url: "http://lyd.nrk.no/nrk_radio_p1_rogaland_mp3_m.xspf"
  },{
    id: "nrk-p1-sogn-og-fjordane",
    url: "http://lyd.nrk.no/nrk_radio_p1_sogn_og_fjordane_mp3_m.xspf"
  },{
    id: "nrk-p1-sorlandet",
    url: "http://lyd.nrk.no/nrk_radio_p1_sorlandet_mp3_m.xspf"
  },{
    id: "nrk-p1-telemark",
    url: "http://lyd.nrk.no/nrk_radio_p1_telemark_mp3_m.xspf"
  },{
    id: "nrk-p1-troms",
    url: "http://lyd.nrk.no/nrk_radio_p1_troms_mp3_m.xspf"
  },{
    id: "nrk-p1-trondelag",
    url: "http://lyd.nrk.no/nrk_radio_p1_trondelag_mp3_m.xspf"
  },{
    id: "nrk-p1-vestfold",
    url: "http://lyd.nrk.no/nrk_radio_p1_vestfold_mp3_m.xspf"
  },{
    id: "nrk-p1-pluss",
    url: "http://lyd.nrk.no/nrk_radio_p1pluss_mp3_m.xspf"
  },{
    id: "nrk-p2",
    url: "http://lyd.nrk.no/nrk_radio_p2_mp3_m.xspf"
  },{
    id: "nrk-p3",
    url: "http://lyd.nrk.no/nrk_radio_p3_mp3_m.xspf",
    worker: "StationJob::NRKInvert"
  },{
    id: "nrk-national-rap-show",
    url: "http://lyd.nrk.no/nrk_radio_p3_national_rap_show_mp3_m.xspf"
  },{
    id: "nrk-pyro",
    url: "http://lyd.nrk.no/nrk_radio_p3_pyro_mp3_m.xspf"
  },{
    id: "nrk-radioresepsjonen",
    url: "http://lyd.nrk.no/nrk_radio_p3_radioresepsjonen_mp3_m.xspf"
  },{
    id: "nrk-urort",
    url: "http://lyd.nrk.no/nrk_radio_p3_urort_mp3_m.xspf"
  },{
    id: "nrk-sami-radio",
    url: "http://lyd.nrk.no/nrk_radio_sami_mp3_m.xspf"
  },{
    id: "nrk-sport",
    url: "http://lyd.nrk.no/nrk_radio_sport_mp3_m.xspf"
  },{
    id: "nrk-super",
    url: "http://lyd.nrk.no/nrk_radio_super_mp3_m.xspf"
  },{
    id: "nrk-evenement-1",
    url: "http://lyd.nrk.no/nrk_radio_weblyd01_mp3_m.xspf"
  },{
    id: "nrk-evenement-2",
    url: "http://lyd.nrk.no/nrk_radio_weblyd02_mp3_m.xspf"
  }].each do |info|
    Class.new(Format::NRK) do
      config do
        id info.fetch(:id)
        url info.fetch(:url)
        exclude ["Neste Blir"]
      end
    end
  end
end