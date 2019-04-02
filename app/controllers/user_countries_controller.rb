class UserCountriesController < ApplicationController

  get '/welcome/:id/:name' do
    @user = User.find(session[:user_id])
    erb :"/countries/welcome"
  end

end
