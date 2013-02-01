require 'devise_sociable/hooks/sociable'

module Devise
  module Models
    module Sociable
      
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      def active?(last_access)
        self.class.actives(last_access).include?(self)
      end
      
      module ClassMethods
        
        def actives(last_access)
          uses_cookies ? actives_cookies(last_access) : actives_server(last_access)
        end
        
        def uses_cookies
          session_store == ActionDispatch::Session::CookieStore
        end
        
        private
        
        def session_store
          # ::Application.config.session_store
          Rails.application.config.session_store
        end
        
        def actives_server(last_access)
          session_class = session_store::Session
          ids = session_class.where("updated_at >= ?", last_access).map do |session|
            data = session.data['warden.user.user.session']
            key = session.data['warden.user.user.key']
            last = data && data['last_request_at']
            key && (last >= last_access) ? key[1][0] : nil
          end.compact
          where(id: ids)
        end
        
        def actives_cookies(last_access)
          User.where("last_request_at >= ? AND (last_sign_out_at IS NULL OR last_sign_out_at < last_request_at)", last_access)
        end
      end
      
 
    end
  end
end