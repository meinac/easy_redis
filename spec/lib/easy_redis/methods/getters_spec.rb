require 'spec_helper'

describe EasyRedis::Getters do

  before(:each) do
    @user = User.create(name: "Mehmet Emin")
    @user.r_set("foo", true)
  end

  context 'r_get method' do
    it 'should set value for given attribute and returns true' do
      expect(@user.r_get("foo")).to eql(true)
    end
  end

  context 'redis_get method' do
    it 'should set value for given attribute and returns true' do
      expect(@user.redis_get("foo")).to eql(true)
    end
  end

  context 'r_get_attribute method' do
    it 'should set value for given attribute and returns true' do
      expect(@user.r_get_foo).to eql(true)
    end
  end

  context 'redis_get_attribute method' do
    it 'should set value for given attribute and returns true' do
      expect(@user.redis_get_foo).to eql(true)
    end
  end

end
