class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.string :content
      t.date :date
      t.string :country_name
      t.string :city_name
      t.integer :user_id
    end
  end
end
