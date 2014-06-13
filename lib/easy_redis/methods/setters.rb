module EasyRedis
  
  module Setters

    def r_set(attribute, value)
      self.redis_cli.hset(redis_key, attribute, YAML.dump(value))
    end

    def method_missing(meth, *args, &block)
      (meth.to_s =~ /^redis_set_(.+)$/ || meth.to_s =~ /^r_set_(.+)$/) ? r_set($1, *args) : super
    end

    alias_method :redis_set, :r_set

  end

end
