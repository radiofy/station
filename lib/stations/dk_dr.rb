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

module Station
  [{
    id: "p6beat",
    station: "p6beat"
  }].each do |station|
    Class.new(Format::HTML) do
      config do
        id station.fetch(:station)
        url "http://www.dr.dk/radio/playlist/tracklistupdate?episodePartId=812560872813&lastMusaId=2235946-1-4"
      end

      def process
        {
          song: data.at_css(".track a").text,
          artist: data.at_css(".name").text
        }
      end
    end
  end
end