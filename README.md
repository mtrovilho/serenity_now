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

    SerenityNow.search('buffy')
    SerenityNow.search('buffy', true) # detailed show info

    SerenityNow.info(:show_id, true) # show info and episode list

    SerenityNow.list(:show_id) # only episode list
    SerenityNow.e_info(:show_id, :ep_no) # episode info, :ep_no is optional

    # data from http://services.tvrage.com/info.php?page=fullschedule
    SerenityNow.schedule


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
