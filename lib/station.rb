module Station
end

Dir[
  File.join(
    File.dirname(__FILE__),
    "formats/*.rb"
  )
].each {|file| require file }

Dir[
  File.join(
    File.dirname(__FILE__),
    "stations/*.rb"
  )
].each {|file| require file }
