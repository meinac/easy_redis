require "easy_redis/methods/getters"
require "easy_redis/methods/setters"
require "easy_redis/methods/deleters"
require "easy_redis/methods/updaters"

module EasyRedis
  
  module Methods

    def self.included(klass)
      klass.class_eval do
        include EasyRedis::Getters
        include EasyRedis::Setters
        include EasyRedis::Deleters
        include EasyRedis::Updaters
      end
    end

    def redis_key
      @redis_key ||= "#{EasyRedis::Redis.namespace}:attributes:#{self.class.name}:#{self.id}"
    end

    def redis_cli
      EasyRedis::Redis.redis
    end

    def use_type_casting?
      EasyRedis::Redis.use_type_casting?
    end

  end

end
