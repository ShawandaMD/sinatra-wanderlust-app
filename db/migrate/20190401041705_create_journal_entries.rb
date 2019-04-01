class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.string :content
      t.date :date
      t.integer :user_id
      t.integer :country_id
    end
  end
end
