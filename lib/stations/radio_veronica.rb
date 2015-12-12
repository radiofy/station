# require_relative "../classes/xml"

# module Station
#   class RadioVeronica < Format::XML
#     def process
#       {
#         song: data.at_css("attribute[name=cue_title]").text,
#         artist: data.at_css("attribute[name=track_artist_name]").text
#       }
#     end
#   end
# end