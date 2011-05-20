class Workspace < ActiveRecord::Base
  def self.table_name() "workspace" end
  set_primary_key :workspace
end
