#
#
#     <li class="track" data-trackId="2283978-1-3" data-artistimageurls="http://www.dr.dk/musik/kunstner/async/118928/GetArtistPictureJson"  itemprop="track" itemscope itemtype="http://schema.org/MusicRecording">
#             <time datetime="00h 16m 47s">12:19</time>
#
#
# <span class="accessibility-label">Patrulje med Kliche </span>
#     <div class="trackInfo" aria-hidden="true" role="presentation">        <span class="track" itemprop="name">
#                 <a href="http://www.dr.dk/musik/titel/Patrulje/2283978-1-3" >Patrulje</a>
#         </span>
#             <span class="name" itemprop="byArtist">Kliche</span>
# </div>
#     <a href="http://www.dr.dk/musik/titel/Patrulje/2283978-1-3" class="accessibility-label">Mere information om "Patrulje"</a>
#
#         <div class="trackDetails">
#
#
#         </div>
#     </li>
#

# <select name="channels"><option disabled="">Vælg kanal</option>
#                     <option value="p1">DR P1</option>
#             <option value="p2">DR P2</option>
#             <option value="p3">P3</option>
#             <option value="p4kbh">P4 København</option>
#             <option value="p4bornholm">P4 Bornholm</option>
#             <option value="p4esbjerg">P4 Esbjerg</option>
#             <option value="p4fyn">P4 Fyn</option>
#             <option value="p4vest">P4 Midt &amp; Vest</option>
#             <option value="p4nord" selected="">P4 Nordjylland</option>
#             <option value="p4sjaelland">P4 Sjælland</option>
#             <option value="p4syd">P4 Syd</option>
#             <option value="p4trekanten">P4 Trekanten</option>
#             <option value="p4aarhus">P4 Østjylland</option>
#             <option value="p5">DR P5</option>
#             <option value="p6beat">DR P6 BEAT</option>
#             <option value="p7mix">DR P7 MIX</option>
#             <option value="p8jazz">DR P8 JAZZ</option>
#     </select>
#
# Alias: dk-dr-p4 till Köpenhamn

module Station
  [{
    id: "p1",
    station: "dk-dr-p1"
  }, {
    id: "p2",
    station: "dk-dr-p2"
  }, {
    id: "p3",
    station: "dk-dr-p3"
  }, {
    id: "p4kbh",
    station: "dk-dr-p4"
  }, {
    id: "p4bornholm",
    station: "dk-p4bornholm"
  }, {
    id: "p4esbjerg",
    station: "dk-p4esbjerg"
  }, {
    id: "p4fyn",
    station: "dk-p4fyn",
  }, {
    id: "p4vest",
    station: "dk-p4vest"
  }, {
    id: "p4nord",
    station: "dk-p4nord"
  }, {
    id: "p4sjaelland",
    station: "dk-p4sjaelland"
  }, {
    id: "p4trekanten",
    station: "dk-p4trekanten"
  }, {
    id: "p4aarhus",
    station: "dk-p4aarhus"
  }, {
    id: "p5",
    station: "dk-p5"
  }, {
    id: "p6beat",
    station: "dk-p6beat"
  }, {
    id: "p7mix",
    station: "dk-p7mix"
  }, {
    id: "p8jazz",
    station: "dk-p8jazz"
  }
].each do |station|
    Class.new(Format::HTML) do
      config do
        id station.fetch(:station)
        url "http://www.dr.dk/radio/live/#{station.fetch(:id)}"
      end

      def process
        return unless track = data.at_css(".playlist-items li.track")
        {
          song: track.at_css(".track > a").text,
          artist: track.at_css(".name").text
        }
      end
    end
  end
end