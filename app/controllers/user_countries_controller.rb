class UserCountriesController < ApplicationController

  get '/welcome/:id/:name' do
    if logged_in?
      @user = current_user
      erb :"/countries/welcome"
    else
      redirect to "/"
    end
  end

end
