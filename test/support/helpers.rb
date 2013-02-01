class ActiveSupport::TestCase
  
  def setup_rails(store)
    config = Struct.new(:session_store).new(store)
    app = Struct.new(:config).new(config)
    Rails.stubs(:application).returns(app)
  end
  
  def session_data(user, last_access)
    {
      "warden.user.user.session"=>{"last_request_at"=>last_access},
      "warden.user.user.key"=>["User", [user.id], ""],
    }
  end
  
  def valid_attributes(attributes={})
    {session_id:(1000*rand).to_i, data:''}.update(attributes)
  end
  
  def create_session(user, last_access)
    session = session_store::Session.create!(valid_attributes(data: session_data(user, last_access)))
    session.update_attribute(:updated_at, last_access)
  end
  
  def create_anonymous_session
    session_store::Session.create!(valid_attributes)
  end
  
  def create_user(atts = {})
    User.create!({email: "user#{(rand*100).to_i}@example.com"}.update(atts))
  end
  
  def session_store
    Rails.application.config.session_store
  end
  
  def clear_store
    session_store::Session.delete_all
    User.delete_all
  end
end