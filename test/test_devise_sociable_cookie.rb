require 'test_helper'


class TestDeviseSociableCookies < ActiveSupport::TestCase
  
  
  setup do
    @user1 = create_user(last_request_at:8.minutes.ago)
    @user2 = create_user(last_request_at:12.minutes.ago)
    @user3 = create_user(last_request_at:8.minutes.ago, last_sign_out_at:5.minutes.ago)
  end
  
  teardown do
    User.delete_all
  end

  test "should have active users" do
    setup_rails(ActionDispatch::Session::CookieStore)
    assert User.actives(10.minutes.ago) == [@user1], 'actives'
  end

  test "user can be (in)active" do
    setup_rails(ActionDispatch::Session::CookieStore)
    assert @user1.active?(10.minutes.ago) == true, 'user 1'
    assert @user2.active?(10.minutes.ago) == false, 'user 2'
    assert @user3.active?(10.minutes.ago) == false, 'user 3'
  end
    
end
