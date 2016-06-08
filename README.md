# Starline Telematics

[![Dependency Status](https://gemnasium.com/badges/github.com/sharipov-ru/starline.svg)](https://gemnasium.com/github.com/sharipov-ru/starline)
[![Code Climate](https://codeclimate.com/github/sharipov-ru/starline/badges/gpa.svg)](https://codeclimate.com/github/sharipov-ru/starline)

StarlineTelematics is a ruby library-wrapper over telematics JSON data from
satellite security and monitoring service which is used in StarLine car alarm
systems (https://starline-online.ru)

The purpose of the library is to provide easy way for getting your car tracks
data and present them in usable format for further analyzing / building 
applications around it.

The library uses [this fastest available & lightweight implementation](https://github.com/paulnsorensen/fast_haversine) of calculating distance between two points by [Haversine formula](https://en.wikipedia.org/wiki/Haversine_formula).

The library is for personal use only and, of course, it doesn't send your data
anywhere so you can be confident using it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'starline'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install starline

## Usage

Read JSON files:

```ruby
telematics = StarLine::Telematics.new(track_file_path)    
```

Get GeoPoint objects:

```ruby
telematics.geo_points
```

Get all tracks - connections between geo points:

```ruby
telematics.tracks
```

Filter out tracks when with zero distance:

```ruby
telematics.tracks.without_parking_tracks
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sharipov-ru/starline. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

