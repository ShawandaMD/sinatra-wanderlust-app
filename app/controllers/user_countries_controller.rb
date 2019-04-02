class UserCountriesController < ApplicationController

  get '/welcome/:id/:name' do
    @user = User.find(session[:user_id])
    "Hi #{@user.name}"
  end

end
