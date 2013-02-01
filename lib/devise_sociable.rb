unless defined?(Devise)
  require 'devise'
end
require 'devise_sociable'

Devise.add_module :sociable, :model => 'devise_sociable/model'

module DeviseSociable
  
end

require 'devise_sociable/rails'