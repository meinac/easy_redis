require 'spec_helper'

describe EasyRedis::Fetchers do

  before(:each) do
    @user = User.create(name: "Furkan Ayhan")
  end

  context 'r_fetch method with block' do
    it 'should raise error for new records' do
      allow(EasyRedis::Redis).to receive(:raise_non_existent_object_error?) { true }
      u = User.new
      expect{u.r_fetch("foo") {"bar"}}.to raise_error(NonExistentObjectError)
    end
    it 'should not raise because not call block' do
      expect(@user.r_fetch("foo") {"bar"}).to eql("bar")
      expect(@user.r_fetch("foo") {raise}).to eql("bar")
    end
    it 'should set value for given attribute and returns the given value' do
      expect(@user.r_fetch("foo") {"bar"}).to eql("bar")
    end
    it 'should not update value for given attribute and returns the old value' do
      @user.r_fetch("foo") {"bar"}
      expect(@user.r_fetch("foo") {"baz"}).to eql("bar")
    end
  end

  context 'r_fetch method with parameter' do
    it 'should raise error for new records' do
      allow(EasyRedis::Redis).to receive(:raise_non_existent_object_error?) { true }
      u = User.new
      expect{u.r_fetch("foo", "bar")}.to raise_error(NonExistentObjectError)
    end
    it 'should not raise because not call block' do
      expect(@user.r_fetch("foo", "bar")).to eql("bar")
      expect(@user.r_fetch("foo") {raise}).to eql("bar")
    end
    it 'should set value for given attribute and returns the given value' do
      expect(@user.r_fetch("foo", "bar")).to eql("bar")
    end
    it 'should not update value for given attribute and returns the old value' do
      @user.r_fetch("foo", "bar")
      expect(@user.r_fetch("foo", "baz")).to eql("bar")
    end
  end

  context 'redis_fetch method with block' do
    it 'should set value for given attribute and returns the given value' do
      expect(@user.redis_fetch("foo") {"bar"}).to eql("bar")
    end
    it 'should not update value for given attribute and returns the old value' do
      @user.redis_fetch("foo") {"bar"}
      expect(@user.redis_fetch("foo") {"baz"}).to eql("bar")
    end
  end

  context 'redis_fetch method with parameter' do
    it 'should set value for given attribute and returns the given value' do
      expect(@user.redis_fetch("foo", "bar")).to eql("bar")
    end
    it 'should not update value for given attribute and returns the old value' do
      @user.redis_fetch("foo", "bar")
      expect(@user.redis_fetch("foo", "baz")).to eql("bar")
    end
  end

end
