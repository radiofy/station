module Station
  class Gullkanalen < Format::RPC
    config do
      id "radioskelleftea"
      url "http://s1.goldtown.se:2199/external/rpc.php?callback=callback&m=streaminfo.get&username=rask&charset=&mountpoint=&rid=rask"
    end
  end
end
