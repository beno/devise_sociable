class DeviseSociable<%= table_name.camelize.singularize %> < ActiveRecord::Migration
  def self.up
    add_column :<%= table_name %>, :last_request_at, :datetime
    add_column :<%= table_name %>, :last_sign_out_at, :datetime
  end
  
  def self.down
    remove_column :<%= table_name %>, :last_request_at
    remove_column :<%= table_name %>, :last_sign_out_at
  end
end