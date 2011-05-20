class User < ActiveRecord::Base
  def self.table_name() "user" end
  set_primary_key :username
end
