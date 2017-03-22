class UsersController < ApplicationController

  def index
  end

  def new
  end


  def login
    if session[:id]
    end
    @user = User.find_by(email:params[:email])
    if @user
      if params[:password] == @user.password
        session[:id] = @user.id
        session[:name] = @user.fname
        session[:state] = @user.state
        redirect_to "/events/index"
      end
    else
      flash[:message] = @user.errors.full_messages
      redirect_to '/'
    end
  end

  def create
    @user = User.create(fname: params[:fname], password: params[:password], lname: params[:lname], email: params[:email], city: params[:city], state: params[:state])
    session[:user_id] = @user.id
    if @user.valid?
      session[:name] = @user.fname
      session[:state] = @user.state
      session[:id] = @user.id
      @user.save
      redirect_to '/events/index'
    else
      flash[:message] = @user.errors.full_messages
      redirect_to '/'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(fname: params[:fname], lname: params[:lname], email: params[:email], city: params[:city], state: params[:state])
    session[:user_id] = @user.id
    if @user.valid?
      session[:name] = @user.fname
      @user.save
      redirect_to '/events/index'
    else
      flash[:message] = @user.errors.full_messages
      redirect_to '/users/' + params[:id].to_s + '/show'
    end
  end

  def show
    @user = User.find(session[:id])
  end

  def logout
    reset_session
    redirect_to '/'
  end
















end
