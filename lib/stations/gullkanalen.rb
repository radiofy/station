module Station
  class Gullkanalen < Format::RPC
    config do
      id "gullkanalen"
      url "https://cp9.shoutcheap.com:2199/external/rpc.php?callback=callback&m=streaminfo.get&username=mauest00&mountpoint=&rid=mauest00"
    end
  end
end

