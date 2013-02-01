require 'test_helper'


class TestDeviseSociable < ActiveSupport::TestCase
  
  setup do
    Application.config.session_store = ActionDispatch::Session::CookieStore
    @user1 = create_user(last_request_at:8.minutes.ago)
    @user2 = create_user(last_request_at:12.minutes.ago)
    @user3 = create_user(last_request_at:8.minutes.ago, last_sign_out_at:5.minutes.ago)
  end
  
  teardown do
    clear_store
  end

  test "should have active users" do
    assert User.actives(10.minutes.ago) == [@user2]
  end

  test "user can be (in)active" do
    assert @user1.active?(10.minutes.ago) == false
    assert @user2.active?(10.minutes.ago) == true
    assert @user3.active?(10.minutes.ago) == false
  end
    
end
