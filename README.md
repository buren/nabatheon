# Nabatheon

Extract named entities and lemmas using StanfordCoreNLP.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nabatheon'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nabatheon

## Usage

```ruby
text = 'Angela Merkel met Nicolas Sarkozy on January 25th in Berlin to discuss a new austerity package. Sarkozy looked pleased, but Merkel was dismayed.'
Nabatheon.annotate(text)
```

## Contributing

1. Fork it ( https://github.com/buren/nabatheon/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
