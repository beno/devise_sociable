require 'devise_sociable/hooks/sociable'

module Devise
  module Models
    module Sociable
      
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      def active?(last_access)
        self.class.cached?(self) || self.class.actives(last_access).include?(self)
      end
      
      def deactivate!
        self.class.remove_from_cache(self)
      end
      
      module ClassMethods
        
        @@actives_cache = {}
        
        def actives(last_access)
          uses_cookies? ? actives_cookies(last_access) : actives_server(last_access)
        end
        
        def cached?(user)
          @@actives_cache[user.id].present?
        end

        def cache_actives(last_access)
          actives = {}
          self.actives(last_access).each do |user|
            actives[user.id] = user
          end
          @@actives_cache = actives
        end 
        
        def remove_from_cache(user)
          @@actives_cache.delete(user.id)
        end
                
        def uses_cookies?
          session_store == ActionDispatch::Session::CookieStore
        end
        
        def actives_cache
          @@actives_cache
        end
        
        private
                
        def session_store
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