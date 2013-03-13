Warden::Manager.after_set_user do |record, warden, opts|
  if record.class.uses_cookies?
    record.update_attribute('last_request_at', Time.zone.now)
  else
    scope = opts[:scope]
    warden.session(scope)['last_request_at'] = Time.zone.now
  end
end

Warden::Manager.before_logout do |record, warden, opts|
  begin
    record.deactivate!
    if record.class.uses_cookies?
      record.update_attribute('last_sign_out_at', Time.zone.now)
    end
  rescue NoMethodError
    #catch logout calls with no active user
  end
end
