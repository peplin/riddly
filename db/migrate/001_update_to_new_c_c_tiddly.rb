class UpdateToNewCCTiddly < ActiveRecord::Migration
  def self.up
    self.add_column(:tiddly_wiki_entry, :workspace_name, :string, :default => '')
    self.rename_column(:tiddly_wiki_entry, :version, :revision)
    self.change_column(:tiddly_wiki_entry, :tags, :text)

    self.rename_column(:tiddly_wiki_entry_version, :version, :revision)
    self.rename_column(:tiddly_wiki_entry_version, :oid, :tiddler_id)

    self.drop_table(:tiddler)
    self.drop_table(:tiddler_revisions)

    self.rename_table(:tiddly_wiki_entry, :tiddler)
    self.rename_table(:tiddly_wiki_entry_version, :tiddler_revisions)
  end

  def self.down
    # Unfortunately, can't bring back the dropped tiddler table

    self.remove_column(:tiddler, :workspace_name)
    self.rename_column(:tiddler, :revision, :version)
    self.change_column(:tiddler, :tags, :string)

    self.rename_column(:tiddler_revisions, :revision, :version)
    self.rename_column(:tiddler_revisions, :tiddler_id, :oid)

    self.rename_table(:tiddler, :tiddly_wiki_entry) 
    self.rename_table(:tiddler_revisions, :tiddly_wiki_entry_version) 
  end
end

