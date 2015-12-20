# Station

Station parsers for [Radiofy.se](http://radiofy.se). Not yet in production.

## Example station

``` ruby
module Station
  class MyStation < Format::JSON
    config do
      id "unique-id"
      url "http://example.com/current-song.json"
    end

    def process
      { artist: data[:artist], song: data[:title] }
    end
  end
end
```

## Check station

`EXPAND=1 STATION=unique-id bundle exec rake`
## Check all stations

`EXPAND=1 bundle exec rake`

## Contributing

1. Fork it ( https://github.com/[my-github-username]/stations/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
