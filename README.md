# EasyRedis

Helper methods for activerecord objects to use redis easily.
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
    
    EasyRedis::Redis.configure(redis: Redis.new)
    

Examples:

    u = User.find(1) #sample ActiveRecord object
    u.r_set("foo", "bar")
    u.r_set_foo("bar")
    u.redis_set("foo", "bar")
    u.redis_set_foo("bar")

    u.r_get("foo")
    u.r_get_foo
    u.redis_get("foo")
    u.redis_get_foo

    u.r_del("foo")
    u.r_del_foo
    u.redis_del("foo")
    u.redis_del_foo

    u.r_set_foo true
    u.r_get_foo #returns true

    u.r_set_foo 1
    u.r_get_foo #returns 1

## Contributing

1. Fork it ( https://github.com/[my-github-username]/easy_redis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
