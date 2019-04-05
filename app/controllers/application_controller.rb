require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_wanderlust"
  end

  get "/" do
    erb :index
  end

  helpers do #written in controller and accessible in views
    #write one for making sure the user id and session id macthes
    def logged_in? #will return true or false
      !!session[:user_id]
    end
    def current_user #finds the current user
      User.find(session[:user_id])
    end
    def belongs_to_user_id
      !!User.find(session[:user_id]) == JournalEntry.user_id
    end
  end

end
