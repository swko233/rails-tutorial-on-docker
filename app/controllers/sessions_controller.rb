class SessionsController < ApplicationController
  def new
  end

  def create
    # binding pry
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # 本当は正しくない
      render 'new'
      # redirect_to help_path
    end
  end
  
  def destroy
  end

end
