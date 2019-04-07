require 'pry'
class JournalEntriesController < ApplicationController

  get '/user/:id' do
    if logged_in?
      @user = current_user
      @entries_all = JournalEntry.where("user_id = ?", @user.id)
      erb :"/journal_entries/user_entries"
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
      flash[:notice] = "Your entry is missing some content!"
    end
  end

#SHOW
  get '/journal_entries/:id' do
    @entry = JournalEntry.find_by_id(params[:id])
    if !@entry
      flash[:notice] = "This article does not exist!"
      redirect to "/"
    else
      erb :"/journal_entries/show"
    end
  end

#EDIT
  get '/journal_entries/:id/edit' do
    @entry = JournalEntry.find_by_id(params[:id])
    if @entry.user_id == current_user.id
      erb :"/journal_entries/edit"
    else
      flash[:notice] =  "This isnt your article!"
      redirect to "/user/#{current_user.id}"
      #redirect to "/user/#{current_user.id}"
    end
  end

#EDIT UPDATE
  patch '/journal_entries/:id' do
    @entry = JournalEntry.find_by_id(params[:id])
    @entry.country_name = params[:country_name]
    @entry.city_name = params[:city_name]
    @entry.title = params[:title]
    @entry.content = params[:content]
    @entry.date = Date.today
    @entry.save
    redirect to "/user/#{current_user.id}"
  end

#DELETE
  delete '/journal_entries/:id/delete' do
    @entry = JournalEntry.find_by_id(params[:id])
    if @entry.user_id == current_user.id
      @entry.delete
      redirect to "/user/#{current_user.id}"
    else
      flash[:notice] = "This isnt your article!"
    end
  end

end
