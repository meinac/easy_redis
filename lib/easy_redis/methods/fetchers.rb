module EasyRedis
  
  module Fetchers

    def r_fetch(attribute, value = nil)
      r_get(attribute) || r_rset(attribute, (value || yield))
    end

    alias_method :redis_fetch, :r_fetch

  end

end