class SessionController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    p = params.require(:session).permit(:email, :password)
    if user = User.find_by_email(p[:email].downcase) and user.authenticate(p[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      redirect_to login_url, notice: 'Password invalid'
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
