SerenityNow
===========

Minimalist Ruby wrapper for [TVRage API][rage].

"Serenity now, insanity later"


Installation
------------

Add this line to your application's Gemfile:

    gem 'serenity_now'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install serenity_now


Usage
-----

    @api = SerenityNow::SerenityAPI.new
    @api.search('buffy')
    @api.search('buffy', true) # for detailed show info


Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


License
-------

[MIT][license]


[rage]: http://services.tvrage.com/
[license]: https://github.com/mtrovilho/serenity_now/blob/master/LICENSE
