require 'pry'
class UserController < ApplicationController

  get '/signup' do
    erb :'/user/signup'
  end

  post '/signup' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      if params[:name] == "" || params[:email] == "" || params[:password] == ""
        redirect to "/signup/failure"
      else
        @user.save
        #binding.pry
        session[:user_id] = @user.id
        redirect to "welcome/#{@user.id}/#{@user.name}"
      end
  end

  get '/login' do
    erb :"/user/login"
  end

  post '/login' do
    @user = User.find_by(params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "welcome/#{@user.id}/#{@user.name}"
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
