# require_relative "./nrk"

# module Station
#   class NRKInvert < Station::NRK
#     def process
#       result = super
#       return if not result
#       return if not result[:song] or not result[:artist]
#       {
#         song: result[:artist],
#         artist: result[:song].split(/\s+\+\s+/).first
#       }
#     end
#   end
# end