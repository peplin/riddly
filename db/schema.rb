# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 2) do

  create_table "admin_of_workspace", :id => false, :force => true do |t|
    t.string "username",                      :null => false
    t.string "workspace_name", :limit => 100, :null => false
  end

  create_table "group", :id => false, :force => true do |t|
    t.string "name", :limit => 50,       :null => false
    t.text   "desc", :limit => 16777215, :null => false
  end

  create_table "group_membership", :id => false, :force => true do |t|
    t.string "user_id",                  :null => false
    t.string "group_name", :limit => 50, :null => false
  end

  create_table "instance_history", :force => true do |t|
    t.string "date",        :limit => 20,  :null => false
    t.string "version",     :limit => 50,  :null => false
    t.string "description", :limit => 500, :null => false
  end

  create_table "login_session", :id => false, :force => true do |t|
    t.string "user_id",                      :null => false
    t.string "session_token", :limit => 150, :null => false
    t.string "expire",        :limit => 16,  :null => false
    t.string "ip",            :limit => 15,  :null => false
  end

  create_table "permissions", :id => false, :force => true do |t|
    t.integer "read",                          :null => false
    t.integer "insert",                        :null => false
    t.integer "edit",                          :null => false
    t.integer "delete",                        :null => false
    t.string  "group_name",     :limit => 50,  :null => false
    t.string  "workspace_name", :limit => 100, :null => false
  end

  create_table "tiddler", :force => true do |t|
    t.string  "title",                         :default => "", :null => false
    t.text    "body",                                          :null => false
    t.text    "fields",                                        :null => false
    t.string  "modified",       :limit => 128, :default => "", :null => false
    t.string  "created",        :limit => 128, :default => "", :null => false
    t.string  "modifier",                      :default => "", :null => false
    t.string  "creator",                       :default => "", :null => false
    t.integer "revision",                      :default => 0,  :null => false
    t.text    "tags",                                          :null => false
    t.string  "workspace_name",                :default => ""
  end

  create_table "tiddler_revisions", :force => true do |t|
    t.string  "title",                     :default => "", :null => false
    t.text    "body",                                      :null => false
    t.text    "fields",                                    :null => false
    t.string  "modified",   :limit => 128, :default => "", :null => false
    t.string  "modifier",                  :default => "", :null => false
    t.integer "revision",                  :default => 0,  :null => false
    t.string  "tags",                      :default => "", :null => false
    t.integer "tiddler_id",                :default => 0,  :null => false
  end

  create_table "user", :primary_key => "username", :force => true do |t|
    t.string "password",   :limit => 50,  :null => false
    t.string "short_name", :limit => 50,  :null => false
    t.string "long_name",  :limit => 100, :null => false
  end

  create_table "workspace", :primary_key => "name", :force => true do |t|
    t.string  "twLanguage",                :limit => 10, :null => false
    t.integer "keep_revision",                           :null => false
    t.integer "require_login",                           :null => false
    t.integer "session_expire",                          :null => false
    t.integer "tag_tiddler_with_modifier",               :null => false
    t.string  "char_set",                  :limit => 10, :null => false
    t.string  "hashseed",                  :limit => 50, :null => false
    t.string  "status",                    :limit => 10, :null => false
    t.string  "tiddlywiki_type",           :limit => 30, :null => false
    t.string  "default_anonymous_perm",    :limit => 4,  :null => false
    t.string  "default_user_perm",         :limit => 4,  :null => false
    t.string  "rss_group",                 :limit => 50, :null => false
    t.string  "markup_group",              :limit => 50, :null => false
  end

  create_table "workspace_view", :force => true do |t|
    t.string   "username",  :null => false
    t.string   "workspace", :null => false
    t.datetime "time",      :null => false
  end

end
