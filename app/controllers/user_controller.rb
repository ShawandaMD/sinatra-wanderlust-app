require 'pry'
class UserController < ApplicationController

  get '/signup' do
    erb :'/user/signup'
  end

  post '/signup' do
    @user = User.new(params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect to "/user/#{@user.id}"
      else
        redirect to "/signup/failure"
      end
  end

  get '/login' do
    erb :"/user/login"
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/user/#{@user.id}"
      else
        redirect to "/login/failure"
      end
  end

  get '/signup/failure' do
    erb :"/user/signup_failure"
  end

  get '/login/failure' do
    erb :"/user/login_failure"
  end

  get '/logout' do
    session.clear
    redirect to "/"
  end


end
