require "easy_redis/methods/methods"

class ActiveRecord::Base

  include EasyRedis::Methods

end