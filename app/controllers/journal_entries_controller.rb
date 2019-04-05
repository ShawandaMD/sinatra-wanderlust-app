require 'pry'
class JournalEntriesController < ApplicationController

  get '/welcome/:id/:name' do #A new log in is showing other entry posts
    if logged_in? #|| belongs_to_user_id
      @user = current_user
      @entries_all = JournalEntry.all
      erb :"/journal_entries/welcome"
    else
      redirect to "/"
    end
  end

  get '/journal_entry/new' do
    erb :"/journal_entries/new"
  end

#CREATE
  post '/journal_entries' do
    @entry = JournalEntry.new(params)
    if @entry.valid?
      @entry.date = Date.today
      @entry.save
    redirect to "/journal_entries/#{@entry.id}"
    else
      "Your entry is missing some content!"
    end
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
    @entry.country_name = params[:title]
    @entry.city_name = params[:title]
    @entry.title = params[:title]
    @entry.content = params[:content]
    @entry.date = Date.today
    @entry.save
    redirect to "/welcome/#{current_user.id}/#{current_user.name}"
  end

#DELETE
  delete '/journal_entries/:id/delete' do
    @entry = JournalEntry.find_by_id(params[:id])
    @entry.delete
    redirect to "/welcome/:id/:name"
  end

end
