require 'easy_redis'
require 'pry'
require 'redis'
Dir["#{File.dirname(__FILE__)}/support/*.rb"].each   {|f| require f }

RSpec.configure do |config|

  EasyRedis::Redis.configure(redis: Redis.new)

  config.after(:each) do
    EasyRedis::Redis.redis.flushdb
  end

end
