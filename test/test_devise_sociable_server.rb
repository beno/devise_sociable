require 'test_helper'

class TestDeviseSociableServer < ActiveSupport::TestCase
  
  setup do
    setup_rails(ActiveRecord::SessionStore)
    @user1 = create_user
    @user2 = create_user
    create_session(@user1, 12.minutes.ago)
    create_session(@user2, 8.minutes.ago)
    create_anonymous_session
  end
  
  teardown do
    ActiveRecord::SessionStore::Session.delete_all
    User.delete_all
  end

  test "server: should have active users" do
    assert User.actives(10.minutes.ago) == [@user2]
  end

  test "server: user can be (in)active" do
    assert @user1.active?(10.minutes.ago) == false
    assert @user2.active?(10.minutes.ago) == true
  end
    
end
