class SessionsController < ApplicationController
  
  def new
  end

  # Save the user id inside the browser cookie.  

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      @error_login='Invalid Username/password!'
      render :new, alert: @error_login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
