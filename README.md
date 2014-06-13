# EasyRedis

Helper methods for activerecord objects to use redis easily
Don't worry about the type casting. EasyRedis does type conversions!

## Installation

Add this line to your application's Gemfile:

    gem 'easy_redis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_redis

## Usage

Create a file under initializers directory and set a redis client like below:
    
    EasyRedis::Redis.configure(:redis => Redis.new)

Examples:

    u = User.find(1)
    u.r_set("key", "value")
    u.redis_set("key", "value")
    u.redis_set_key("value")

    u.r_get("key")
    u.redis_get("key")
    u.redis_get_key

    u.r_del("key")
    u.redis_del("key")
    u.redis_del_key

    u.r_update("key", "value")
    u.redis_update("key", "value")
    u.redis_update_key("value")

## Contributing

1. Fork it ( https://github.com/[my-github-username]/easy_redis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
