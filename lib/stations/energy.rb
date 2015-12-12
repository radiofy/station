# require_relative "../classes/xml"

# module Station
#   class Energy < Base::XML
#     def process
#       media = ["artist", "song"].map{ |w| data.at_css("Item #{w}").try(:content) }
#       {
#         artist: media.first,
#         song: media.last
#       }
#     end
#   end
# end