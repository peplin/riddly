class FixNewlines < ActiveRecord::Migration
  def self.up
    old_tiddlers = Array[
      'StyleSheet',
      'StyleSheetLayout',
      'ViewTemplate',
      'EditTemplate',
      'PageTemplate',
      'MarkupPostBody',
      'SideBarOptions',
      'AdvancedOptions',
      'TabMoreShadowed',
      'TabAll',
      'TabTimeline']

    old_tiddlers.each {|name|
      t = Tiddler.find_by_title(name)
      t.delete if t
    }

    Tiddler.all.each {|t|
      t.body = t.body.gsub(/\\n/, "\n")
      t.body = t.body.gsub(/&lt;/, "<")
      t.body = t.body.gsub(/&gt;/, ">")
      t.body = t.body.gsub(/&quot;/, "\"")
      t.body = t.body.gsub(/&amp;/, "&")
      t.title = t.title.gsub(/&quot;/, "\"")
      t.title = t.title.gsub(/'/, "")
      t.save! 
    }
  end

  def self.down
  end
end

