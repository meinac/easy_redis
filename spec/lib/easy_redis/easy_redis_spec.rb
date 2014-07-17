require 'spec_helper'

describe EasyRedis::Redis do

  context 'redis method' do
    it 'should return nil object if redis did not setted' do
      expect(EasyRedis::Redis.redis).to eql(nil)
    end
    it 'should return nil object if redis did not setted' do
      redis = Redis.new
      EasyRedis::Redis.configure(redis: redis)
      expect(EasyRedis::Redis.redis).to eql(redis)
    end
  end

  context 'redis setter method' do
    it 'should set redis as param' do
      redis = Redis.new
      EasyRedis::Redis.redis = redis
      expect(EasyRedis::Redis.redis).to eql(redis)
    end
  end

  context 'namespace method' do
    it 'should return easyredis by default if namespace did not setted' do
      expect(EasyRedis::Redis.namespace).to eql('easyredis')
    end
    it 'should return setted namespace if namespace setted' do
      EasyRedis::Redis.configure(namespace: "namespace")
      expect(EasyRedis::Redis.namespace).to eql('namespace')
    end
  end

  context 'raise_non_existent_object_error? method' do
    it 'should return true by default' do
      expect(EasyRedis::Redis.raise_non_existent_object_error?).to eql(true)
    end
    it 'should return false if setted as false' do
      EasyRedis::Redis.configure(raise_non_existent_object_error: false)
      expect(EasyRedis::Redis.raise_non_existent_object_error?).to eql(false)
    end
  end

end