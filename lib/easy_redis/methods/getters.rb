module EasyRedis
  
  module Getters

    def r_get(attribute)
      val = self.redis_cli.hget(redis_key, attribute)
      val.nil? ? nil : YAML.load(val.to_s)
    end

    def method_missing(meth, *args, &block)
      (meth.to_s =~ /^redis_get_(.+)$/ || meth.to_s =~ /^r_get_(.+)$/) ? r_get($1, *args) : super
    end

    alias_method :redis_get, :r_get

  end

end
