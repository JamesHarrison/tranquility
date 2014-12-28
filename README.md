# Tranquility

*Tranquility is a work in progress and not really that usable right now, and certainly untested. Use at your risk.*

Tranquility is an API wrapper for EVE Online's various XML and CREST APIs for Ruby, intended to make developing against them a little more pleasant.

The CREST API wrapper is dynamically generated.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tranquility'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tranquility

## Usage

```ruby
require 'tranquility'
c = Tranquility::Crest.root
c.regions['11000001'].first.constellations.inspect
```

See the `examples` directory for more examples.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tranquility/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
