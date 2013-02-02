require 'test_helper'


class TestDeviseSociableCache < ActiveSupport::TestCase
  
  
  setup do
    setup_rails(ActionDispatch::Session::CookieStore)
    @user1 = create_user(last_request_at:8.minutes.ago)
    @user2 = create_user(last_request_at:12.minutes.ago)
    @user3 = create_user(last_request_at:8.minutes.ago, last_sign_out_at:5.minutes.ago)
  end
  
  teardown do
    User.delete_all
  end

  test "should cache active users" do
    User.cache_actives(10.minutes.ago)
    assert User.actives_cache  == { @user1.id => @user1 }, 'actives cache'
  end
  
  test "should cache more active users" do
    @user3.update_attribute(:last_request_at, 1.minute.ago)
    User.cache_actives(15.minutes.ago)
    assert User.actives_cache  == { @user1.id => @user1, @user2.id => @user2, @user3.id => @user3 }, 'actives cache more'
  end
  
  test "should return cached value if cached" do
    User.cache_actives(10.minutes.ago)
    @user1.update_attribute(:last_sign_out_at, 1.minute.ago)
    assert User.cached?(@user1) == true, 'cached value'
    assert @user1.active?(10.minutes.ago) == true, 'cached value'
  end
  
  test "should return new value if cache updated" do
    @user1.update_attribute(:last_sign_out_at, 1.minute.ago)
    User.cache_actives(10.minutes.ago)
    assert User.cached?(@user1) == false, 'cached value updated'
    assert @user1.active?(10.minutes.ago) == false, 'cached value updated'
  end
  
  test "should be removed from cache" do
    User.cache_actives(10.minutes.ago)
    @user1.update_attribute(:last_sign_out_at, 1.minute.ago)
    @user1.deactivate!
    assert User.cached?(@user1) == false, 'cached value removed'
  end
    
end
