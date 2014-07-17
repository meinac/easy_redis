module EasyRedis

  module Deleters

    def r_del(attribute)
      self.redis_cli.hdel(redis_key, attribute)
    end

    def method_missing(meth, *args, &block)
      (meth.to_s =~ /^redis_del_(.+)$/ || meth.to_s =~ /^r_del_(.+)$/ || meth.to_s =~ /^r_delete_(.+)$/ || meth.to_s =~ /^redis_delete_(.+)$/) ? r_del($1) : super
    end

    alias_method :r_delete, :r_del
    alias_method :redis_del, :r_del
    alias_method :redis_delete, :r_del

  end

end