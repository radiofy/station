# Station

Station parsers for [radiofy.se](http://radiofy.se).

## How does it work?

Each station consists of a class which encapsulates the logic used to 
parse the data for a given station URL. Each class has to define three things.

1. A unique name, preferably in lowercase without whitespace
2. A URL for which the current playing song can be accessed
3. A method called `process` that given some raw data returns 
a hash on the form `{ artist: "...", song: "..." }` or nil. The
data can be accessed using the `data` variable. The type of `data` depends on what
format class you inherit from. If you for example inherit from 
`Format::JSON` the `data` will consists of a plain ruby hash created by
passing the data given by `url` to `JSON.parse`. Take a look at the current
formats `lib/formats` and classes `lib/stations` for examples.

## Example station

A station is defined in `lib/stations`

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

## Install dependencies

Before you can get started you need to install the dependencies.
This can be done using `bundle install` after cloning the project.
Take a look at the [contributing](#contributing) section for more information.

## Test your station

To verify that it acts as expected you can invoke it 
using the following command

`EXPAND=1 STATION=unique-id bundle exec rake`

Set `STATION` to whatever id you chose before.

## Contributing

1. Fork it ( https://github.com/radiofy/station/fork )
2. Create your station branch (`git checkout -b my-station`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-station`)
5. Create a new pull request here on Github.

We'll merge the pull request as soon as we can.

## Questions?

Send us an email at [radiofy.se/contact](http://radiofy.se/contact).