require "easy_redis/version/version"
require "easy_redis/errors/non_existent_object_error"
require "easy_redis/initialize/active_record"

module EasyRedis

  class Redis

    @@redis = nil
    @@config = {
      namespace: "easyredis",
      raise_non_existent_object_error: true,
      redis: nil
    }
    @@valid_config_keys = @@config.keys

    class << self

      def redis
        @@redis
      end

      def redis=(redis)
        @@redis = redis
      end

      def namespace
        @@config[:namespace]
      end

      def raise_non_existent_object_error?
        @@config[:raise_non_existent_object_error]
      end

      def configure(opts = {})
        opts.each do |k,v|
          @@config[k.to_sym] = v if @@valid_config_keys.include? k.to_sym
        end
        self.redis = @@config[:redis] if @@config[:redis].present?
      end

    end

  end

end