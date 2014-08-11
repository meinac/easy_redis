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

  context 'r_rset method' do
    it 'should raise error for new records' do
      allow(EasyRedis::Redis).to receive(:raise_non_existent_object_error?) { true }
      u = User.new
      expect{u.r_rset_foo "bar"}.to raise_error(NonExistentObjectError)
    end
    it 'should set value for given attribute and returns the given value' do
      expect(@user.r_rset("foo", "bar")).to eql("bar")
    end
    it 'should update value for given attribute and returns the given value' do
      @user.r_rset("foo", "bar")
      expect(@user.r_rset("foo", "baz")).to eql("baz")
    end
  end

  context 'redis_rset method' do
    it 'should set value for given attribute and returns the given value' do
      expect(@user.redis_rset("foo", "bar")).to eql("bar")
    end
    it 'should update value for given attribute and returns the given value' do
      @user.redis_rset("foo", "bar")
      expect(@user.redis_rset("foo", "baz")).to eql("baz")
    end
  end

  context 'r_rset_attribute method' do
    it 'should set value for given attribute and returns the given value' do
      expect(@user.r_rset_boo("bar")).to eql("bar")
    end
    it 'should update value for given attribute and returns the given value' do
      @user.r_rset_foo("bar")
      expect(@user.r_rset_foo("baz")).to eql("baz")
    end
  end

  context 'redis_rset_attribute method' do
    it 'should set value for given attribute and returns the given value' do
      expect(@user.redis_rset_boo("bar")).to eql("bar")
    end
    it 'should update value for given attribute and returns the given value' do
      @user.redis_rset_foo("bar")
      expect(@user.redis_rset_foo("baz")).to eql("baz")
    end
  end

end
