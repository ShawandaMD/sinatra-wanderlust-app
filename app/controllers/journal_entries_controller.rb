class JournalEntriesController < ApplicationController

  get '/journal_entries' do #incomplete route! Posts all journal entries with country info
    @entries_all = JournalEntry.all

  end

  get '/journal_entry/new' do
    erb :"/journal_entries/new"
  end

#CREATE
  post '/journal_entries' do
    #if logged_in?
    @entry = JournalEntry.create(title: params[:title], content: params[:content], date: params[:date])
    redirect to "/journal_entries/#{@entry.id}"
  end


end
