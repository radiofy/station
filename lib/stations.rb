require "stations/version"

module Stations
  # Your code goes here...
end

# stations = JSON.parse(File.read(Rails.root.join("lib/station/lists/ilikeradio.json")))
# stations.each do |s|
#   station({
#     station: s.fetch("name").parameterize,
#     url: "http://unison.mtgradio.se/api/v1/channel?with=currentsong&type[]=live&type[]=playlist",
#     worker: Station::Ilikeradio,
#     args: { id: s.fetch("id") }
#   })
# end

# station({
#   station: "nrk-alltid-nyheter",
#   url: "http://lyd.nrk.no/nrk_radio_alltid_nyheter_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-folkemusikk",
#   url: "http://lyd.nrk.no/nrk_radio_folkemusikk_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-jazz",
#   url: "http://lyd.nrk.no/nrk_radio_jazz_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-klassisk",
#   url: "http://lyd.nrk.no/nrk_radio_klassisk_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-mp3",
#   url: "http://lyd.nrk.no/nrk_radio_mp3_mp3_m.xspf",
#   worker: Station::NRKInvert
# })

# station({
#   station: "nrk-p13",
#   url: "http://lyd.nrk.no/nrk_radio_p13_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-buskerud",
#   url: "http://lyd.nrk.no/nrk_radio_p1_buskerud_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-finnmark",
#   url: "http://lyd.nrk.no/nrk_radio_p1_finnmark_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-hedmark-og-oppland",
#   url: "http://lyd.nrk.no/nrk_radio_p1_hedmark_og_oppland_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-hordaland",
#   url: "http://lyd.nrk.no/nrk_radio_p1_hordaland_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-more-og-romsdal",
#   url: "http://lyd.nrk.no/nrk_radio_p1_more_og_romsdal_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-nordland",
#   url: "http://lyd.nrk.no/nrk_radio_p1_nordland_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-ostfold",
#   url: "http://lyd.nrk.no/nrk_radio_p1_ostfold_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-ostlandssendingen",
#   url: "http://lyd.nrk.no/nrk_radio_p1_ostlandssendingen_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-rogaland",
#   url: "http://lyd.nrk.no/nrk_radio_p1_rogaland_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-sogn-og-fjordane",
#   url: "http://lyd.nrk.no/nrk_radio_p1_sogn_og_fjordane_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-sorlandet",
#   url: "http://lyd.nrk.no/nrk_radio_p1_sorlandet_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-telemark",
#   url: "http://lyd.nrk.no/nrk_radio_p1_telemark_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-troms",
#   url: "http://lyd.nrk.no/nrk_radio_p1_troms_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-trondelag",
#   url: "http://lyd.nrk.no/nrk_radio_p1_trondelag_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-vestfold",
#   url: "http://lyd.nrk.no/nrk_radio_p1_vestfold_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p1-pluss",
#   url: "http://lyd.nrk.no/nrk_radio_p1pluss_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p2",
#   url: "http://lyd.nrk.no/nrk_radio_p2_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-p3",
#   url: "http://lyd.nrk.no/nrk_radio_p3_mp3_m.xspf",
#   worker: Station::NRKInvert
# })

# station({
#   station: "nrk-national-rap-show",
#   url: "http://lyd.nrk.no/nrk_radio_p3_national_rap_show_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-pyro",
#   url: "http://lyd.nrk.no/nrk_radio_p3_pyro_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-radioresepsjonen",
#   url: "http://lyd.nrk.no/nrk_radio_p3_radioresepsjonen_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-urort",
#   url: "http://lyd.nrk.no/nrk_radio_p3_urort_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-sami-radio",
#   url: "http://lyd.nrk.no/nrk_radio_sami_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-sport",
#   url: "http://lyd.nrk.no/nrk_radio_sport_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-super",
#   url: "http://lyd.nrk.no/nrk_radio_super_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-evenement-1",
#   url: "http://lyd.nrk.no/nrk_radio_weblyd01_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "nrk-evenement-2",
#   url: "http://lyd.nrk.no/nrk_radio_weblyd02_mp3_m.xspf",
#   worker: Station::NRK
# })

# station({
#   station: "julradio",
#   url: "http://julradio.se/inc/now_playing.php",
#   worker: Station::Julradio
# })

# station({
#   station: "skyradio",
#   url: "http://www.skyradio.nl/cdn/player_skyradio.xml",
#   worker: Station::Skyradio
# })

# station({
#   station: "antennevorarlberg",
#   url: "http://www.antennevorarlberg.at/api/onair.php",
#   worker: Station::Antennevorarlberg
# })

# station({
#   station: "radioactiveystad",
#   url: "http://radioactiveystad.se",
#   worker: Station::Radioactiveystad
# })

# station({
#   station: "goldtown",
#   url: "http://goldtown.se/",
#   worker: Station::Goldtown
# })

# station({
#   station: "netrock101",
#   url: "http://netrock101.servebeer.com:9000/",
#   worker: Station::Shoutcast
# })

# station({
#   station: "80s-metal-fm",
#   url: "http://player.bigrradio.com/streamdata.php?h=107.155.111.234&p=8310&i=&f=&c=67430",
#   worker: Station::The80smetalfm
# })

# station({
#   station: "soulsticeradio24",
#   url: "http://p5.radiocdn.com/player.php?hash=9674d030a99756a3028e66cf4bff430aa5c6b008&action=getCurrentData",
#   worker: Station::Soulsticeradio24
# })

# station({
#   station: "ordentligradio",
#   url: "http://dj1.no/nowplaying.xml",
#   worker: Station::Ordentligradio
# })

# station({
#   station: "radiobastad",
#   url: "http://212.31.164.21:8000/",
#   worker: Station::Shoutcast
# })

# station({
#   station: "starfm",
#   url: "http://rds.starfm.ee/jsonRdsInfo.php?Name=Star&jsoncallback=cb",
#   worker: Station::Starfm
# })

# station({
#   station: "cityradion",
#   url: "http://www.cityradion.nu/gismo/files/406/test/last10_5.html",
#   worker: Station::Cityradion
# })

# station({
#   station: "radiobern1",
#   url: "http://www.radiobern1.ch/assets/webcache/timeline.html",
#   worker: Station::Radiobern1
# })

# station({
#   station: "musikmixen",
#   url: "http://www.musikmixen.se/index.php?option=com_sam2joom&view=nowplaying&format=raw",
#   worker: Station::Musikmixen
# })

# station({
#   station: "lite-fm-101-1",
#   url: "http://www.litefm.se/include/right/justnu_standalone.php",
#   worker: Station::LiteFm1011
# })

# station({
#   station: "neradio-sweden",
#   url: "http://213.163.66.141",
#   worker: Station::Neradio
# })

# station({
#   station: "neradio-nonstop",
#   url: "http://ms.neradio.com:5500",
#   worker: Station::Neradio
# })

# station({
#   station: "neradio-hardstyle",
#   url: "http://load.hardstyle.nu:443",
#   worker: Station::Neradio
# })

# station({
#   station: "neradio-house-trance",
#   url: "http://fire1.neradio.com",
#   worker: Station::Neradio
# })

# station({
#   station: "east-fm",
#   url: "http://spelasnu.eastfm.se/getPlayNowApp.aspx?rid=ID1&num=50&next=0&callback=cb",
#   worker: Station::EastFm
# })

# station({
#   station: "musique",
#   url: "http://ice.casterplay.net:8000/lounge.xspf",
#   worker: Station::XSPF
# })

# station({
#   station: "aura",
#   url: "http://stream.anr.dk/aura.xspf",
#   worker: Station::XSPF
# })

# station({
#   station: "radio-clubzone",
#   url: "http://www.radioclubzone.com/scripts/ajxshowtrack.php",
#   worker: Station::RadioClubzone
# })

# station({
#   station: "rbb-radioeins",
#   url: "http://www.radioeins.de/include/rad/nowonair/now_on_air.html",
#   worker: Station::RbbRadioeins
# })

# station({
#   station: "omgkpop-radio",
#   url: "http://stream.omgkpop.com:8234/autodj.xspf",
#   worker: Station::OmgkpopRadio
# })

# station({
#   station: "wdr2",
#   url: "http://www.wdr2.de/musik/titelsuche100.jsp", 
#   worker: Station::WDR
# })

# station({
#   station: "funkhaus-europa",
#   url: "http://www.funkhauseuropa.de/playlist/titelsuche104.html", 
#   worker: Station::FunkhausEuropa
# })

# station({
#   station: "wdr5",
#   url: "http://www.wdr5.de/playlist136.jsp", 
#   worker: Station::WDR
# })

# station({
#   station: "wdr4",
#   url: "http://www.wdr4.de/musik/titelsuche110.html", 
#   worker: Station::WDR
# })

# station({
#   station: "1live",
#   url: "http://www.einslive.de/radiotext/RADIOTXT.TXT",
#   worker: Station::OneLive,
#   exclude: ["1live"]
# })

# station({
#   station: "181-fm-rock-40",
#   url: "http://relay.181.fm:8028/",
#   worker: Station::Shoutcast,
#   exclude: ["181.Fm", "Music Man", "1fm30"]
# })

# station({
#   station: "gold24-fm",
#   url: "http://gold24.fm:8084/",
#   worker: Station::Shoutcast
# })

# station({
#   station: "kbk-radio",
#   url: "http://media.kbkradio.se:80",
#   worker: Station::Shoutcast
# })

# station({
#   station: "kanal-rewind",
#   url: "http://radio.euronet.nu:8080",
#   worker: Station::Shoutcast
# })

# station({
#   station: "gullkanalen",
#   url: "http://67.212.189.122:8010/",
#   worker: Station::Shoutcast
# })

# station({
#   station: "radioprime",
#   url: "http://www.radioprime.com/sarpsborg/",
#   worker: Station::Radioprime
# })

# station({
#   station: "radio-af-lunds-studentradio",
#   url: "http://linus.af.lu.se/api/?single",
#   worker: Station::RadioAfLundsStudentradio
# })

# station({
#   station: "gimme-indie",
#   url: "http://www.gimmeindie.se/wp-content/uploads/radio/ice_meta.json",
#   worker: Station::GimmeIndie
# })

# {
#   "bbcradio1" => "radio-1",
#   "bbcradio2" => "radio-2",
#   "bbc6music" => "6music",
#   "bbc1xtra" => "1xtra"
# }.each_pair do |key, station|
#   station({
#     station: station,
#     url: "http://trackplaying.appspot.com/?brand=#{key}",
#     worker: Station::Bbc,
#     exclude: ["BBC"]
#   })
# end

# station({
#   station: "radioseven",
#   url: "http://www.radioseven.se/currentsong.asp",
#   worker: Station::Radioseven
# })

# station({
#   url: "http://www.soundicradio.com/phpCustom/playedsong.php?passkey=soundic",
#   worker: Station::SoundicRadio,
#   station: "soundic-radio"
# })

# mtg = [{
#   station: "mix-megapol",
#   id: "1"
# }, {
#   station: "mix-megapol-goteborg",
#   id: "2"
# }, {
#   station: "mix-megapol-malmo",
#   id: "3"
# }, {
#   station: "rockklassiker",
#   id: "4"
# }, {
#   station: "the-voice",
#   id: "5"
# }, {
#   station: "vinyl-107",
#   id: "6"
# }, {
#   station: "radio-107-5",
#   id: "7"
# }, {
#   station: "party-people",
#   id: "23"
# }, {
#   station: "run-nation",
#   id: "26"
# }, {
#   station: "we-love-80s",
#   id: "29"
# }, {
#   station: "2012-hits",
#   id: "42"
# }, {
#   station: "nrj",
#   id: "49"
# }]

# mtg.each do |station|
#   station({
#     url: "http://static.radioplay.se/data/all_se.jsonp",
#     station: station.fetch(:station),
#     worker: Station::Radioplay,
#     exclude: ["Mer musik kommer snart", "Mastermix"],
#     args: { id: station.fetch(:id) }
#   })
# end

# dk_mtg = [{
#   station: "radiosoft-dk",
#   id: "21"
# }, {
#   station: "the-voice-dk",
#   id: "17"
# }, {
#   station: "nova-dk",
#   id: "18"
# }, {
#   station: "radio-100-dk",
#   id: "20"
# }, {
#   station: "myRock-dk",
#   id: "56"
# }, {
#   station: "pop-fm-dk",
#   id: "19"
# }, {
#   station: "radio-klassisk-dk",
#   id: "22"
# }, {
#   station: "digster-top-30",
#   id: "68"
# }]

# dk_mtg.each do |station|
#   station({
#     url: "http://static.radioplay.se/data/all_dk.jsonp",
#     station: station.fetch(:station),
#     worker: Station::Radioplay,
#     exclude: ["Vi er tillbage med mere", "Mastermix"],
#     args: { id: station.fetch(:id) }
#   })
# end

# [{
#   station: "radio1",
#   id: 1
# }, {
#   station: "bandit-rock-stockholm",
#   id: 2
# }, {
#   station: "rix-fm",
#   id: 3
# }, {
#   station: "lugna-favoriter",
#   id: 4
# }].each do |s|
#   station({
#     url: "http://streamcontrol.mtgradio.se/api/songs/current/#{s.fetch(:id)}?callback=callback",
#     station: s.fetch(:station),
#     worker: Station::MTG,
#     exclude: s[:exclude]
#   })
# end

# doc = Nokogiri::XML(File.read(Rails.root.join("lib/station/lists/sr.xml")))
# doc.css("channel").each do |channel|
#   name = channel.attr("name")
#   station({
#     station: name.parameterize,
#     url: "http://api.sr.se/api/v2/playlists/rightnow?channelid=#{channel.attr("id")}",
#     worker: Station::Sr,
#     exclude: ["Radioapan"]
#   })
# end

# [{
#   station: "guldkanalen", 
#   id: "ID1"
# }, {
#   station: "dansbandskanalen", 
#   id: "ID2" 
# }].each do |s|
#   station({
#     url: "http://dbmedia.spelasnu.se/getPlayNowApp.aspx?rid=#{s[:id]}&num=1&next=0&callback=abc",
#     station: s[:station],
#     worker: Station::DBMedia
#   })
# end

# station({
#   url: "http://2.st.nu/guld/active/justnu/",
#   station: "guld-106-6",
#   worker: Station::Guld1066
# })

# [{
#   station: "energy-hit-music-only",
#   id: 829751913
# },{
#   station: "energy-dance",
#   id: 138080853
# }, {
#   station: "energy-hot",
#   id: 1072168283
# }, {
#   station: "energy-r-n-b",
#   id: 850377837
# }, {
#   station: "energy-love",
#   id: 1378634725
# }, {
#   station: "energy-special",
#   id: 1332572254
# }, {
#   station: "energy-live",
#   id: 1293381027
# },{
#   station: "energy-pop",
#   id: 1781596043
# }, {
#   station: "energy-rock",
#   id: 612578376
# }, {
#   station: "energy-hiphop",
#   id: 1907644740
# }, {
#   station: "mastermix",
#   id: 1947139847,
#   exclude: ["Mastermix"]
# }, {
#   station: "energy-lounge",
#   id: 1120309038
# }].each do |s|
#   station({
#     url: "http://wr.nrj.net/xml/?q=getCurrentSong&radio=#{s.fetch(:id)}",
#     station: s.fetch(:station),
#     worker: Station::Energy,
#     exclude: s[:exclude]
#   })
# end

# station({
#   url: "http://www.hotmixradio.fr/transfert/hotmixradiodance_spodtronic.xml",
#   station: "hotmixradio",
#   worker: Station::Hotmixradio
# })

# station({
#   url: "http://www.538.nl/static/last3.php",
#   station: "radio-538",
#   worker: Station::Radio538
# })

# station({
#   url: "http://www.radioveronica.nl/cdn/player_veronica.xml",
#   station: "radio-veronica",
#   worker: Station::RadioVeronica
# })

# station({
#   station: "vinylgodis",
#   url: "http://p5.radiocdn.com/player.php?hash=760188b7633d415b1f9cba992012247fdeea4903&action=getCurrentData",
#   worker: Station::Vinylgodis
# })

# station({
#   url: "http://www.slamfm.nl/media/onair.xml",
#   station: "slam-fm",
#   worker: Station::SlamFM
# })

# [{
#   id: "P1D",
#   station: "dk-dr-p1"
# }, {
#   id: "P2D",
#   station: "dk-dr-p2"
# }, {
#   id: "P3",
#   station: "dk-dr-p3"
# }, {
#   id: "KH4",
#   station: "dk-dr-p4"
# }].each do |station|
#   station({
#     station: station.fetch(:station),
#     url: "http://www.dr.dk/playlister/feeds/nowNext/nowPrev.drxml?items=1&cid=#{station[:id]}",
#     worker: Station::DK
#   })
# end

# [{
#   url: "http://www.1.fm/home/stationplaylist?id=top40",
#   station: "1-fm-top-40"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=60s_70s",
#   station: "1-fm-50s-60s"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=80s_90s",
#   station: "1-fm-80s-70s"
# },{
#   url: "http://www.1.fm/home/stationplaylist?id=90s",
#   station: "1-fm-80s-90s"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=Blues",
#   station: "1-fm-blues"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=bombayBeats",
#   station: "1-fm-bombay-beats"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=ChilloutLounge",
#   station: "1-fm-chillout-lounge"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=Club",
#   station: "1-fm-club-1"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=Country",
#   station: "1-fm-country"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=Dance",
#   station: "1-fm-dance"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=Jamz",
#   station: "1-fm-jamz"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=HighVoltage",
#   station: "1-fm-high-voltage"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=oldschool",
#   station: "1-fm-adult-choice"
# }, {
#   url: "http://www.1.fm/home/stationplaylist?id=Trance",
#   station: "1-fm-trance"
# }].each do |station|
#   station(station.merge({
#     worker: Station::OneFm,
#     exclude: ["1fm30"]
#   }))
# end

# station({
#   station: "radio-dcm",
#   url: "http://www.radiodcm.se/onair.asp?x=1",
#   worker: Station::RadioDcm
# })

# station({
#   station: "dansbandsdax",
#   url: "http://www.dansbandsdax.se/player/current.asp",
#   worker: Station::Dansbandsdax
# })

# station({
#   station: "powerfm",
#   url: "http://api.powerfm.se/",
#   worker: Station::Powerfm
# })

# station({
#   station: "fun-radio-malmo",
#   url: "http://funradio.se/program/lastplay.js",
#   worker: Station::FunRadioMalmo
# })

# station({
#   station: "playdio",
#   url: "http://141.255.187.217:80",
#   worker: Station::Shoutcast
# })

# station({
#   station: "countrykanalen",
#   url: "http://37.187.90.121:3326",
#   worker: Station::Shoutcast
# })

# station({
#   station: "jamfm",
#   url: "http://www.jamfm.se/current_song.php",
#   worker: Station::Jamfm,
#   exclude: ["Guest DJ"]
# })

# station({
#   station: "distfm",
#   url: "http://www.distfm.se/ajax/current_song.php",
#   worker: Station::Distfm
# })

# station({
#   station: "gtvoice",
#   url: "http://gtvoice.org/radiostats.php",
#   worker: Station::Gtvoice
# })

# station({
#   station: "radiotreby",
#   url: "http://www.radiotreby.se/",
#   worker: Station::Radiotreby
# })

# station({
#   station: "radiohits",
#   url: "http://www.radiohits.se/cur-song.php",
#   worker: Station::Radiohits
# })

# station({
#   station: "retrofm",
#   url: "http://s1.retrofm.se:9000/index.html?sid=1",
#   worker: Station::Retrofm
# })

# station({
#   station: "powerhitradio",
#   url: "http://streamcontrol.mtgradio.se/api/songs/current/6",
#   worker: Station::Powerhitradio
# })

# station({
#   station: "coolahits",
#   url: "http://www.coolahits.se/last10_2.asp",
#   worker: Station::Coolahits
# })

# station({
#   station: "knac",
#   url: "http://www.knac.com/text1.txt",
#   worker: Station::Knac
# })

# station({
#   station: "radiosor",
#   url: "http://www.radiosor.no/spillesnaaforside.php",
#   worker: Station::Radiosor
# })