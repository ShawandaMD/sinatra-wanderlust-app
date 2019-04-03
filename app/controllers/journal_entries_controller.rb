class JournalEntriesController < ApplicationController

  get '/journal_entry/all' do #incomplete route! Posts all journal entries with country info
    @entries_all = JournalEntry.all
    erb :
  end

  get '/journal_entry/new' do
    erb :"/journal_entries/new"
  end


end
