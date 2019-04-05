class JournalEntryChangeContentColumnType < ActiveRecord::Migration
  def up
    change_column :journal_entries, :content, :text
  end

  def down
    change_column :journal_entries, :content, :string
  end

end
