module EasyRedis

  module Setters

    def r_set(attribute, value)
      self.redis_cli.hset(redis_key, attribute, YAML.dump(value))
    end

    def r_rset(attribute, value)
      r_set(attribute, value)
      value
    end

    def method_missing(meth, *args, &block)
      if (meth.to_s =~ /^redis_set_(.+)$/ || meth.to_s =~ /^r_set_(.+)$/)
        r_set($1, *args)
      elsif (meth.to_s =~ /^redis_rset_(.+)$/ || meth.to_s =~ /^r_rset_(.+)$/)
        r_rset($1, *args)
      else
        super
      end
    end

    alias_method :redis_set, :r_set
    alias_method :redis_rset, :r_rset

  end

end
