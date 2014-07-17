require 'spec_helper'

describe EasyRedis::Deleters do

  before(:each) do
    @user = User.create(name: "Mehmet Emin")
    @user.r_set("foo", true)
  end

  context 'r_del method' do
    it 'should delete attribute from redis' do
      @user.r_del("foo")
      expect(@user.r_get("foo")).to eql(nil)
    end
  end

  context 'redis_del method' do
    it 'should delete attribute from redis' do
      @user.redis_del("foo")
      expect(@user.r_get("foo")).to eql(nil)
    end
  end

  context 'r_delete method' do
    it 'should delete attribute from redis' do
      @user.r_delete("foo")
      expect(@user.r_get("foo")).to eql(nil)
    end
  end

  context 'redis_delete method' do
    it 'should delete attribute from redis' do
      @user.redis_delete("foo")
      expect(@user.r_get("foo")).to eql(nil)
    end
  end

  context 'r_del_attribute method' do
    it 'should delete attribute from redis' do
      @user.r_del_foo
      expect(@user.r_get("foo")).to eql(nil)
    end
  end

  context 'redis_del_attribute method' do
    it 'should delete attribute from redis' do
      @user.redis_del_foo
      expect(@user.r_get("foo")).to eql(nil)
    end
  end

  context 'r_delete_attribute method' do
    it 'should delete attribute from redis' do
      @user.r_delete_foo
      expect(@user.r_get("foo")).to eql(nil)
    end
  end

  context 'redis_delete_attribute method' do
    it 'should delete attribute from redis' do
      @user.redis_delete_foo
      expect(@user.r_get("foo")).to eql(nil)
    end
  end

end