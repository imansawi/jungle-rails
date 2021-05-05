class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
      if @user.save
        puts params[:email]
        session[:user_id] = @user.id
        UserMailer.welcome_email(@user).deliver_now
      
        redirect_to [:root], notice: 'Account created successfully'
      else
        flash[:error] = 'An error occured!'
        render 'new'
      end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end