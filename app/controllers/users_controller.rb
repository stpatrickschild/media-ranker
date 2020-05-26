class UsersController < ApplicationController
  def index
    @users = User.all.order(:created_at)
  end

  def show
    @user = User.find_by(id: params[:id])
      if @user.nil?
        head :not_found
        return
      end
    end
  

  def login_form
    @user = User.new
  end

  def login 
    
    user = User.find_by(user_params)
    if user.nil?
      user = User.new(user_params.merge(joined_date: DateTime.now))
      if !user.save
        flash[:warning] = "Weren't able to login"
        redirect_to login_path
        return
      end
      flash[:success] = "Successfully created a new #{user.name} with id #{user.id}"
    else 
      flash[:success] = "successfully logged in as existing user #{user.name}"
    end

    session[:user_id] = user.id
    redirect_to root_path 
  end

  def logout
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      unless user.nil?
        session[:user_id] = nil
        flash[:success] = "Successfully logged out"
      else  
        session[:user_id] = nil
        flash[:warning] = "Unknown User"
      end
    else  
      flash[:warning] = "You must be logged in to log out"
    end
    redirect_to root_path
  end
  
  def current
    @user = User.find_by(id: session[:user_id])
    if user.nil?
      flash[:error] = "You should log in to view the page"
      redirect_to root_path
    end
  end

  private

  def user_params
    return params.require(:user).permit(:name)
  end

end