class JournalEntriesController < ApplicationController

  get '/welcome/:id/:name' do
    if logged_in?
      @user = current_user
      @entries_all = JournalEntry.all
      erb :"/countries/welcome"
    else
      redirect to "/"
    end
  end


  get '/journal_entries' do #incomplete route! Posts all journal entries with country info
    @entries_all = JournalEntry.all
    erb :"/countries/welcome"
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

#SHOW
  get '/journal_entries/:id' do
    @entry = JournalEntry.find_by_id(params[:id])
    erb :"/journal_entries/show"
  end

#EDIT
  get '/journal_entries/:id/edit' do
    @entry = JournalEntry.find_by_id(params[:id])
    erb :"/journal_entries/edit"
  end

#EDIT UPDATE
  patch '/journal_entries/:id' do
    @entry = JournalEntry.find_by_id(params[:id])
    @entry.title = params[:title]
    @entry.content = params[:content]
    @entry.save
    redirect to "/journal_entries/#{@entry.id}"
  end

#DELETE
  delete '/journal_entries/:id/delete' do
    @entry = JournalEntry.find_by_id(params[:id])
    @entry.delete
    redirect to '/journal_entries'
  end

end
