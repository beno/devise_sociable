require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'support'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'test/unit'
require 'active_record'
require 'helpers'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

class Migration < ActiveRecord::Migration
  def up
    create_table :sessions do |t|
      t.string :session_id, :null => false
      t.text :data
      t.timestamps
    end
    create_table :users do |t|
      t.string :email
      t.string :last_request_at
      t.string :last_sign_out_at
      t.timestamps
    end
  end
end

Migration.new.up

class Application
  def self.config
    @conf ||= Struct.new(:session_store).new
  end
end


require 'devise'
require 'devise/orm/active_record'

require 'devise_sociable'

class User < ActiveRecord::Base

  devise :sociable
end

