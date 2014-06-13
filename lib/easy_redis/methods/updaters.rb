module EasyRedis

  module Updaters

    def r_update(attribute, value)
      self.r_del(attribute)
      self.r_set(attribute, value)
    end

    def method_missing(meth, *args, &block)
      (meth.to_s =~ /^redis_update_(.+)$/ || meth.to_s =~ /^r_update_(.+)$/) ? r_delete($1, *args) : super
    end

    alias_method :redis_update, :r_update



  end

end