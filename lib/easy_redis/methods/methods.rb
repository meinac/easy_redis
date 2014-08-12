require "easy_redis/methods/getters"
require "easy_redis/methods/setters"
require "easy_redis/methods/deleters"
require "easy_redis/methods/fetchers"

module EasyRedis
  
  module Methods

    def self.included(klass)
      klass.class_eval do
        include EasyRedis::Getters
        include EasyRedis::Setters
        include EasyRedis::Deleters
        include EasyRedis::Fetchers
      end
    end

    def redis_key
      raise NonExistentObjectError if self.new_record? && EasyRedis::Redis.raise_non_existent_object_error?
      @redis_key ||= "#{EasyRedis::Redis.namespace}:attributes:#{self.class.name}:#{self.id}"
    end

    def redis_cli
      EasyRedis::Redis.redis
    end

  end

end
