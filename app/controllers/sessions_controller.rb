class SessionsController < ApplicationController
  def new

  end

  def create
    username = params[:session][:username]
    password = params[:session][:password]

    user = User.where("username LIKE ?", username).first
    if user && user.authenticate(password)
      # if user.activated?
        log_in user
        redirect_to user_path(user)
      # else
      #   flash[:warning] = "Account not activated, check your email for the activation link"
      #   redirect_to :root
      # end
    else
      flash.now[:danger] = "Invalid email/password"
      render "new"
    end
  end

  def destroy
    log_out
    flash[:success] = "You have successfully logged out"
    redirect_to :root
  end
end
