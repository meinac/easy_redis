require 'spec_helper'

describe EasyRedis::Setters do

  before(:each) do
    @user = User.create(name: "Mehmet Emin")
  end

  context 'r_set method' do
    it 'should raise error for new records' do
      allow(EasyRedis::Redis).to receive(:raise_non_existent_object_error?) { true }
      u = User.new
      expect{u.r_set_foo "bar"}.to raise_error(NonExistentObjectError)
    end
    it 'should set value for given attribute and returns true' do
      expect(@user.r_set("foo", "bar")).to eql(true)
    end
    it 'should update value for given attribute and returns false' do
      @user.r_set("foo", "bar")
      expect(@user.r_set("foo", "baz")).to eql(false)
    end
  end

  context 'redis_set method' do
    it 'should set value for given attribute and returns true' do
      expect(@user.redis_set("foo", "bar")).to eql(true)
    end
    it 'should update value for given attribute and returns false' do
      @user.redis_set("foo", "bar")
      expect(@user.redis_set("foo", "baz")).to eql(false)
    end
  end

  context 'r_set_attribute method' do
    it 'should set value for given attribute and returns true' do
      expect(@user.r_set_boo("bar")).to eql(true)
    end
    it 'should update value for given attribute and returns false' do
      @user.r_set_foo("bar")
      expect(@user.r_set_foo("baz")).to eql(false)
    end
  end

  context 'redis_set_attribute method' do
    it 'should set value for given attribute and returns true' do
      expect(@user.redis_set_boo("bar")).to eql(true)
    end
    it 'should update value for given attribute and returns false' do
      @user.redis_set_foo("bar")
      expect(@user.redis_set_foo("baz")).to eql(false)
    end
  end

end
