class UserCountriesController < ApplicationController

  get '/welcome/:id/:name' do
    @user = current_user
    erb :"/countries/welcome"
  end

end
